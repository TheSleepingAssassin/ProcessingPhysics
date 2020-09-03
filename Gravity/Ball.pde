class Ball {
  PVector pos, vel, acc;
  float r;
  Ball(PVector pos, float r) {
    this.pos = pos;
    this.vel = new PVector();
    this.acc = new PVector();
    this.r = r;
  }

  void bounce() {
    if (pos.x > width - r) {
      pos.x = width - r;
      vel.x *= -0.83;
    } else if (pos.x < r) {
      pos.x = r;
      vel.x *= -0.83;
    }

    if (pos.y > height - r) {
      pos.y = height - r;
      vel.y *= -0.83;
    } else if (pos.y < r) {
      pos.y = r;
      vel.y *= -0.83;
    }
  }

  void applyG() {
    PVector g = new PVector(0, 0.7);
    acc.add(g);
  }

  void update() {
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
  }

  void render() {
    fill(255);
    noStroke();
    ellipse(pos.x, pos.y, r * 2, r * 2);
  }
}
