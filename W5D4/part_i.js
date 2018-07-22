function mysteryScoping1() {
  var x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}

// mysteryScoping1()

function mysteryScoping2() {
  const x = 'out of block';
  if (true) {
    const x = 'in block';
    console.log(x);
  }
  console.log(x);
}

// mysteryScoping2()


function mysteryScoping3() {
  const x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}

// mysteryScoping3

function mysteryScoping4() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  console.log(x);
}

// mysteryScoping4

function mysteryScoping5() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  let x = 'out of block again';
  console.log(x);
}

// mysteryScoping5

// madlib

function madlib(verb, abj, noun) {
  return `We shall ${verb.toUpperCase()} the ${abj.toUpperCase()} and ${noun.toUpperCase()}`
}

// madlib('hi','we','will');


function isSubstring(string, word) {
  arr = string.split(' ')

  arr.forEach((el) => {
    if (word === el) {
      console.log(el)
    }
  });
};

// isSubstring("time to program", "time")

function fizzBuzz(array) {
  const result = [];
  array.forEach((el) => {
    if ((el !== 3) && (el !== 5) ) {
      result.push(el);
    }
  });
  console.log(result);
};

// fizzBuzz([1,2,3,4,5])

function isPrime(number) {
  if (number < 2) {
    return false
  }
  for (let i = 2; i < number; i++) {
    if (number % i === 0) {
      return false;
    }
  }
  return true;
}

// console.log(isPrime(3548563))

function sumOfNPrimes(n) {
  let counter = 0
  let result = 0
  let sum = 0

  while (counter < n) {
    sum++;
    // counter = counter + 1;
    if (isPrime(sum)) {
      result += sum;
      counter++;
    }
  }

  return result
}

console.log(sumOfNPrimes(1))
