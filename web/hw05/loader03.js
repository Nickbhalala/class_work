function init () {
  let submit = document.querySelector ("#submit");
  submit.addEventListener ("click", loadWASM);
}

function loadWASM () {
  let wasmfilename = document.querySelector ("#wasmfilename").value;
  let importObject = {
    imports : {
      console_log : arg => console.log (arg)
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
  });
}
