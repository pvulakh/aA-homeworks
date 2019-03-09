function madLib(verb, adj, noun) {
  console.log(`We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${ noun.toUpperCase()}`);
}

function isSubstring(searchString, subString) {
  if (searchString.includes(subString)) {
    return true;
  } else {
    return false;
  }
}

function fizzBuzz(array) {
  let result = [];

  array.forEach(function(el) {
    if ((el % 3  == 0 && el % 5 != 0 ) || (el % 5 == 0 && el % 3 != 0)) {
      result.push(el);
    }
  });
  return result;
}

function isPrime(num) {
  if (num < 2) {
    return false;
  }

  for (let i = 2; i < num; i++) {
    if (num % i == 0) {
      return false;
    }
  }

  return true;
 }


 function sumOfNPrimes(n) {
   let sum = 0;

   let i = 0;
   let num = 1;

   while (i < n) {
     if (isPrime(num)) {
       sum += num;
       num++;
       i++;
     } else {
       num ++;
     }
   }

   return sum;
 }