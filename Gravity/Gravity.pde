Ball b;

void setup() {
  size(650, 650);
  b = new Ball(new PVector(width / 2, 50), 16);
}

void draw() {
  background(51);
  b.render();
  b.update();
  b.applyG();
  b.bounce();
}
