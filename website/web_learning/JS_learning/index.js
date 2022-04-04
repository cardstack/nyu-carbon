// first js code
console.log('Hello World');

// define a variable
let name = 'Mo';
console.log(name);
// can not be a reserved keyword
// should be meaningful
// cannot start with a number (1name -> wrong)
// cannot contain a space or hyphen (-)
// are case-sensitive

// declare multi-variable
let firstName = 'Mo', lastName = 'Ham';
let firstName = 'Mo';
let lastName = 'Ham';

// constants -> cannot be changed
const interestRate = 0.3;
//interestRate = 1; -> not work 
console.log(interestRate)

//primirive, value types (string, numberm boolean, undefined, null)
let name = 'Jamie'; //String Literal
let age = 30; // Number Literal
let isApproved = true; // Boolean Literal
let lastName = null;
let firstName = undefined;
let color = 'red'

// Reference Type (object, array, function)
let person = {
    name: 'A', 
    age: 30
}

//Dot Notation
person.name = 'J';
console.log(person)
// Bracket Notation
let selection = 'name';
person['name'] = 'M';
person[selection] = 'H';
console.log(person.name);

let selectColors = ['red', 'blue'];
// add element
selectColors[2] = 'green';
selectColors[2] = 1;

// edit by index
console.log(selectColors[0]);

//Functions
function greet(name) {
    console.log('Hello World' + name);
}

// call function
greet('juju');
greet('jamie');

// calculate a value 
function square(numeber) {
    return number * number;
}

let number = square(2);
console.log(number);