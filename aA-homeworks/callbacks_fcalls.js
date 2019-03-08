const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function teaAndBiscuits() {
  let ans1, ans2; 

  reader.question('Would you like some tea?', (answer) => {
    ans1 = answer;
    console.log(`You replied ${ans1}.`);
  });

  reader.question('Would you like some biscuits?', (answer) => {
    ans2 = answer; 
    console.log(`You replied ${ans1}.`);
  });

  const auxVerb1 = (ans1 === 'yes') ? 'do' : "don't";
  const auxVerb2 = (ans2 === 'yes') ? 'do' : "don't";
  console.log(`So you ${auxVerb1} want tea and you ${auxVerb2} want biscuits.`)
  reader.close();
}