function madLib(verb, adj, noun) {
  console.log(`We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${ noun.toUpperCase()}`);
};

function isSubstring(searchString, subString) {
  if (searchString.includes(subString)) {
    return true;
  } else {
    return false;
  }
};

function fizzBuzz(array) {
  array.forEach(function(el)) {
    if (el % 3 || el % 5) {
      return [el];
    };
  }
};