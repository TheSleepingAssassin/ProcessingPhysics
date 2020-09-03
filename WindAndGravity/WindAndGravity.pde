/* No need for the build folder if you work in processing.
I need because I am in Atom */

Ball b;

void setup() {
  size(650, 650);
  b = new Ball(new PVector(width / 2, 50), 2);
}

void draw() {
  background(51);
  b.run();
  if (mousePressed) {
    if (mouseX < b.pos.x) {
      PVector w = new PVector(0.4, 0);
      b.applyForce(w);
    } else if (mouseX > b.pos.x) {
      PVector w = new PVector(-0.4, 0);
      b.applyForce(w);
    }

    if (mouseY < b.pos.y) {
      PVector w = new PVector(0, 0.4);
      b.applyForce(w);
    } else if (mouseY > b.pos.y) {
      PVector w = new PVector(0, -0.4);
      b.applyForce(w);
    }
  }
}
