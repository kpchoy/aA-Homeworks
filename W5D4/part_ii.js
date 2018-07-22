function titleize(arr, printCallback) {
  let titleized = arr.map((el) => `Mx ${el} Jingleheimer Schmidt`);
  printCallback(titleized)
}

// titleize(["Mary", "Brian", "Leo"], function printCallback(el) {
//   for (let i = 0; i < el.length; i++) {
//     console.log(el[i])
//   }
// });

//phase 2

// Elephant.prototype.trumpet: should print "(name) the elephant goes 'phrRRRRRRRRRRR!!!!!!!'"
// Elephant.prototype.grow: should increase the elephant's height by 12 inches
// Elephant.prototype.addTrick(trick): add a new trick to their existing repertoire
// Elephant.prototype.play: print out a random trick, e.g. "(name) is (trick)!"

function Elephant(name, height, tricks) {
  this.name = name;
  this.height = height;
  this.tricks = tricks;
}

Elephant.prototype.trumpet = function () {
  console.log(`${this.name} the elephant goes 'phrRRRRRRRRRRR!!!!!!!'`);
};

Elephant.prototype.grow = function () {
  this.height += 12;
};

Elephant.prototype.addTrick = function (el) {
  this.tricks.push(el)
};

Elephant.prototype.play = function () {
  let rand = Math.floor(Math.random() * this.tricks.length)
  console.log(this.tricks[rand]);
};

bob = new Elephant("joe", 56, []);

// bob.trumpet();
// bob.grow();
// bob.addTrick("Jumpin high");
// bob.addTrick("hello");
// bob.addTrick("stand on one leg");
// bob.addTrick("horray");
//
// console.log(bob);
// bob.play();

//Closures
// dinerBreakfast = function(food) {
//   let original = "I'd like cheesy scrambled eggs please";
//   if (food) {
//     original += `and ${food} please.`
//   }
//   console.log(original)

function dinerBreakfast() {
    let order = "I'd like cheesy scrambled eggs please.";
    console.log(order);

    return function (food) {
      order = `${order.slice(0, order.length - 8)} and ${food} please.`;
      console.log(order);
    };
  };

let bfastOrder = dinerBreakfast();
bfastOrder("chocolate chip pancakes");
bfastOrder("grits");
