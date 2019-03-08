const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function teaAndBiscuits() {
  let ans1, ans2; 

  //nest questions so that q2 gets called after q1 is answered!
  reader.question('Would you like some tea?', (ans1) => {
    console.log(`You replied ${ans1}.`);
    reader.question('Would you like some biscuits?', (ans2) => {
      console.log(`You replied ${ans2}.`);
    });
  });

  const auxVerb1 = (ans1 === 'yes') ? 'do' : "don't";
  const auxVerb2 = (ans2 === 'yes') ? 'do' : "don't";

  console.log(`So you ${auxVerb1} want tea and you ${auxVerb2} want biscuits.`)
  reader.close();
}