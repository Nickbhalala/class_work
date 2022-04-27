function init () {
  let submit = document.querySelector ("#submit");
  submit.addEventListener ("click", loadWASM);

  let compute = document.querySelector ("#compute");
  compute.addEventListener ("click", computeCall);
}

function computeCall () {
  try {
    window.wasm_instance.exports.compute ();
  } catch (err) {
    console.error (err);
  }
}

function loadWASM () {
  let wasmfilename = document.querySelector ("#wasmfilename").value;
  let importObject = {
    imports : {
      console_log : arg => console.log (arg),
      read_input : () => {
        let input1 = document.querySelector ("#input1");
	      let val = input1.value;
        return val;
      },
      write_output : arg => {
        let output1 = document.querySelector ("#output1");
	      output1.value = arg;
      }
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

    let memory = new Uint8Array (instance.exports.memory.buffer);
    window.wasm_memory = memory;

    try {
      console.log (instance.exports.run ());
    } catch (err) {
      console.error (err);
    }
  });
}
