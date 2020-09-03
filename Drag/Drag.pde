Ball[] balls = new Ball[25];

void setup() {
  size(650, 650);
  for (int i = 0; i < balls.length; i++) {
    PVector pos = new PVector(random(width), random(50, 100));
    float mass = random(2, 5);
    balls[i] = new Ball(pos, mass);
  }
}

void draw() {
  background(51);
  for (Ball b : balls) {
    b.run();
    if (mousePressed) {
      if (mouseX < b.pos.x) {
        PVector w = new PVector(0.4, 0);
        b.applyForce(w);
      } else if (mouseX > b.pos.x) {
        PVector w = new PVector(-0.4, 0);
        b.applyForce(w);
      }

      if (mouseY > b.pos.y) {
        PVector w = new PVector(0, 0.4);
        b.applyForce(w);
      } else if (mouseY < b.pos.y) {
        PVector w = new PVector(0, -0.4);
        b.applyForce(w);
      }
    }

    if (b.pos.y > height / 2) {
      b.drag();
    }
  }

  fill(0, 100, 255, 100);
  noStroke();
  rect(0, height / 2, width, height / 2);
}
