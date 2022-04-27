const jsmemory = new WebAssembly.Memory ({
  initial : 64 // 64 * 64KiB = 4096KiB = 4MiB
});

const wasm_memory = new Uint8Array (jsmemory.buffer);

const jstable = new WebAssembly.Table ({
  initial : 1,
  element : "anyfunc" // "funcref" with firefox, "anyfunc" for chrome
});

const global_canvas_width   = new WebAssembly.Global ({ value : "i32", mutable : true }, 0);
const global_canvas_height  = new WebAssembly.Global ({ value : "i32", mutable : true }, 0);
const global_artwork_width  = new WebAssembly.Global ({ value : "i32", mutable : true }, 0);
const global_artwork_height = new WebAssembly.Global ({ value : "i32", mutable : true }, 0);
const global_canvas_addr    = new WebAssembly.Global ({ value : "i32", mutable : true }, 0x10000);
const global_artwork_addr   = new WebAssembly.Global ({ value : "i32", mutable : true }, 0);


let canvas = undefined;
let ctx = undefined;
let canvas_width = undefined;
let canvas_height = undefined;
let imageData = undefined;


function init () {
  let imageSubmit = document.querySelector ("#imagesubmit");
  imageSubmit.addEventListener ("click", loadImage);

  let wasmSubmit = document.querySelector ("#wasmsubmit");
  wasmSubmit.addEventListener ("click", canvasApp);

  let stop = document.querySelector ("#stop");
  stop.addEventListener ("click", setStop);

  loadDrawingLibrary ();
}


function error_out_of_bounds (x, y, data) {
  console.error (`out of bounds error at (${x}, ${y}), data = ${data}`);
}


function random (max) {
  return Math.floor (Math.random () * (max + 1));
}


function loadDrawingLibrary () {
  canvas = document.querySelector ("#canvas");
  global_canvas_width.value = canvas.width;
  global_canvas_height.value = canvas.height;

  ctx = canvas.getContext ("2d");
  ctx.imageSmoothingEnabled = false;

  canvas_width = canvas.width;
  canvas_height = canvas.height;
  imageData = ctx.createImageData (canvas_width, canvas_height);
  
  let wasmfilename = "libdrawing.wasm";
  let importObject = {
    js : {
      memory : jsmemory,
      table : jstable,
      canvas_width : global_canvas_width,
      canvas_height : global_canvas_height,
      artwork_width : global_artwork_width,
      artwork_height : global_artwork_height,
      canvas_addr : global_canvas_addr,
      artwork_addr : global_artwork_addr,
      console_log : arg => console.log (arg),
      error_out_of_bounds : error_out_of_bounds,
      random : random
    }
  };
  fetch (wasmfilename).then (response => {
    console.log ("Received wasm response");
    console.log (response);
    return response.arrayBuffer ();
  }).then (bytes => {
    console.log ("Received wasm bytes");
    console.log (bytes);
    return WebAssembly.instantiate (bytes, importObject);
  }).then (results => {
    console.log ("Loaded wasm module");
    console.log (results);

    let instance = results.instance;
    window.sprite_wasm_instance = instance;
  });
}


function loadImage () {
  let img = new Image ();
  img.addEventListener (
    "load",
    function (e) {
      global_artwork_width.value = img.width;
      global_artwork_height.value = img.height;
      global_artwork_addr.value = global_canvas_addr.value + canvas_width * canvas_height * 4;

      let canvasTmp = document.createElement ("canvas");
      canvasTmp.width = img.width;
      canvasTmp.height = img.height;
      let ctxTmp = canvasTmp.getContext ("2d");
      ctxTmp.drawImage (img, 0, 0);
      console.log (`artwork width = ${img.width}, artwork height = ${img.height}`);
      console.log (`canvasTmp width = ${canvasTmp.width}, canvasTmp height = ${canvasTmp.height}`);
      let imageDataTmp = ctxTmp.getImageData (0, 0, img.width, img.height);
      for (let n = 0; n < img.width * img.height * 4; n++) {
        wasm_memory[n + global_artwork_addr.value] = imageDataTmp.data[n];
      }
    }
  );
  let imagefilename = document.querySelector ("#imagefilename").value;
  img.src = imagefilename;
  document.querySelector ("#artwork").src = imagefilename;
}


function updateCanvas () {
  for (let n = 0; n < canvas_width * canvas_height * 4; n++) {
    imageData.data[n] = wasm_memory[n + global_canvas_addr.value];
  }
  ctx.putImageData (imageData, 0, 0);
}


let stop = false;


function setStop () {
  stop = true;
}


function canvasApp () {
  stop = false;
  let wasmfilename = document.querySelector ("#wasmfilename").value;
  let importObject = {
    js : {
      memory : jsmemory,
      table : jstable,
      canvas_width : global_canvas_width,
      canvas_height : global_canvas_height,
      artwork_width : global_artwork_width,
      artwork_height : global_artwork_height,
      canvas_addr : global_canvas_addr,
      artwork_addr : global_artwork_addr,
      console_log : arg => console.log (arg),
      error_out_of_bounds : error_out_of_bounds,
      random : random,
      calc_canvas_address : sprite_wasm_instance.exports.calc_canvas_address,
      calc_artwork_address : sprite_wasm_instance.exports.calc_artwork_address,
      clear_screen : sprite_wasm_instance.exports.clear_screen,
      draw_image : sprite_wasm_instance.exports.draw_image,
      draw_artwork : sprite_wasm_instance.exports.draw_artwork
    }
  };
  fetch (wasmfilename).then (response => {
    console.log ("Received wasm response");
    console.log (response);
    return response.arrayBuffer ();
  }).then (bytes => {
    console.log ("Received wasm bytes");
    console.log (bytes);
    return WebAssembly.instantiate (bytes, importObject);
  }).then (results => {
    console.log ("Loaded wasm module");
    console.log (results);

    let instance = results.instance;
    window.wasm_instance = instance;

    window.addEventListener ("keydown", function (evt) {
      if (37 <= evt.keyCode && evt.keyCode <= 40) {
        wasm_memory[evt.keyCode] = 1;
        evt.preventDefault ();
      }
    });
    window.addEventListener ("keyup", function (evt) {
      if (37 <= evt.keyCode && evt.keyCode <= 40) {
        wasm_memory[evt.keyCode] = 0;
      }
    });

    let start = null;
    let previousTimestamp = null;

    const progressElt = document.querySelector ("#progress");
    const deltaElt = document.querySelector ("#delta");
    function step (timestamp) {
      if (stop) {
        return;
      }
      
      if (previousTimestamp !== null) {
        let delta = timestamp - previousTimestamp; // ~16ms between calls for a refresh rate of 60Hz (1000/60 = 16.67)
        deltaElt.innerHTML = delta.toFixed (0);
      }
      previousTimestamp = timestamp;
      if (!start) {
        start = timestamp;
      }
      let progress = timestamp - start;
      progressElt.innerHTML = progress.toFixed (0);
      try {
        // Call WASM "step" function
        instance.exports.step (progress);
        // Copy WASM memory for the display into imageData.data and put imageData onto the canvas
        updateCanvas ();
        // Register to run again at the next animation frame
        window.requestAnimationFrame (step);
      } catch (err) {
        console.error (err);
      }
    }
    window.requestAnimationFrame (step);
  });
}
