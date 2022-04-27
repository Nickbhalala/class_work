function init () {
  let button1 = document.querySelector ("#button1");
  button1.addEventListener ("click", printMessageToConsole);
}


function printMessageToConsole (evt) {
  console.log ("this is a normal message");
  console.error ("this is an error message");

  let x = 10;
  console.log (`the value of x is ${x}`);
  console.log (`the value of x + 1 is ${x + 1}`);
}
