function init () {
  let submit = document.querySelector ("#submit");
  submit.addEventListener ("click", canvasApp);

  let stop = document.querySelector ("#stop");
  stop.addEventListener ("click", setStop);
}

let stop = false;

function setStop () {
  stop = true;
}

function canvasApp () {
  stop = false;
  let wasmfilename = document.querySelector ("#wasmfilename").value;
  var importObject = {
    imports : { console_log : arg => console.log (arg) }
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

    let memory = new Uint8Array (instance.exports.memory.buffer);
    window.wasm_memory = memory;

    window.addEventListener ("keydown", function (evt) {
      if (37 <= evt.keyCode && evt.keyCode <= 40) {
        memory[evt.keyCode] = 1;
        evt.preventDefault ();
      }
    });
    window.addEventListener ("keyup", function (evt) {
      if (37 <= evt.keyCode && evt.keyCode <= 40) {
        memory[evt.keyCode] = 0;
      }
    });

    let canvas = document.querySelector ("#canvas");
    let ctx = canvas.getContext ("2d");
    ctx.imageSmoothingEnabled = false;

    let width  = canvas.width;
    let height =  canvas.height;
    let imageData = ctx.createImageData (width, height);

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
        // Copy WASM memory for the display into imageData.data
        for (let n = 0; n < width * height * 4; n++) {
          imageData.data[n] = memory[n + 0x10000];
        }
        // Put imageData onto the canvas
        ctx.putImageData (imageData, 0, 0);
        // Register to run again at the next animation frame
        window.requestAnimationFrame (step);
      } catch (err) {
        console.error (err);
      }
    }
    window.requestAnimationFrame (step);
  });
}
