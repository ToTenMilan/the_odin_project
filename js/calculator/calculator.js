/*global $*/

var firstNumber = undefined;
var secondNumber = undefined;

function add(numone, numtwo) {
  return (Number(numone) + Number(numtwo));
}

function multiply(numone, numtwo) {
  return (Number(numone) * Number(numtwo));
}

function divide(numone, numtwo) {
  return (Number(numone) / Number(numtwo));
}

function subtract(numone, numtwo) {
  return (Number(numone) - Number(numtwo));
}

function input(element) {
  if (firstNumber == undefined) {
    firstNumber = element.innerHTML;
  } else {
    secondNumber = element.innerHTML;
  }
  console.log(firstNumber);
  console.log(secondNumber);
  $('#prompt').innerHTML += element.innerHTML;
}

function operation(element) {
  switch (element.innerHTML) {
    case "+":
      console.log(add(firstNumber, secondNumber));
      break;
    case "-":
      console.log(subtract(firstNumber, secondNumber));
      break;
    case "*":
      console.log(multiply(firstNumber, secondNumber));
      break;
    case "/":
      console.log(divide(firstNumber, secondNumber));
      break;
    case "=":
      firstNumber = null;
      secondNumber = null;
      break;
    case "C":
      firstNumber = null;
      secondNumber = null;
      break;
    default:
      console.log("wazzup");
      break;
  }
}
