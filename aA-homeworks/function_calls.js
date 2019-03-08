function Cat() {
  this.name = 'Markov';
  this.age = 3;
}

function Dog() {
  this.name = 'Noodles';
  this.age = 4;
}

Dog.prototype.chase = function (cat) {
  console.log(`My name is ${this.name} and I'm chasing ${cat.name}! Woof!`)
};

const Markov = new Cat();
const Noodles = new Dog();

/*
> Noodles.chase(Markov) - 'this' => Noodles : automatically sets to obj when called method-style)
My name is Noodles and I'm chasing Markov! Woof!
undefined
  > Noodles.chase.call(Markov, Noodles) -  'this' => first arg = Markov : method called on 'this' which results in a cat chasing a dog
My name is Markov and I'm chasing Noodles! Woof!

syntax: Function.prototype.method.apply(obj, [args]) : calls obj.method(args)
> Dog.prototype.chase.apply(Noodles, [Markov])
My name is Noodles and I'm chasing Markov! Woof!
undefined
> Dog.prototype.chase.apply(Markov, [Noodles])
My name is Markov and I'm chasing Noodles! Woof!
undefined
*/ 
