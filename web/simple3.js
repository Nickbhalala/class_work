function init () {
  let button1 = document.querySelector ("#button1");
  button1.addEventListener ("click", readName);

  let button2 = document.querySelector ("#button2");
  button2.addEventListener ("click", updatePage);
}

function readName (evt) {
  let input1 = document.querySelector ("#input1");
  let name = input1.value;

  let para1 = document.querySelector ("#para1");
  para1.innerHTML = `hello <i>${name}</i>`;

  console.log (`Hi ${name}`);
}

let counter = 0;

function updatePage (evt) {
  let para2 = document.querySelector ("#para2");
  para2.innerHTML = `the counter is <b>${counter}</b>`;

  let input2 = document.querySelector ("#input2");
  input2.value = counter;

  counter = counter + 1;
}
