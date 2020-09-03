class Ball {
  PVector pos, vel, acc;
  float r, mass;
  Ball(PVector pos, float mass) {
    this.pos = pos;
    this.vel = new PVector();
    this.acc = new PVector();
    this.mass = mass;
    this.r = sqrt(this.mass) * 10;
  }

  void run() {
    render();
    update();
    edges();
    applyG();
  }

  void drag() {
    PVector drag = vel.copy();
    drag.normalize();
    drag.mult(-1);

    float c = 0.1;
    float speedSq = vel.magSq();
    drag.setMag(c * speedSq);

    applyForce(drag);
  }

  void applyG() {
    PVector g = new PVector(0, 0.7);
    acc.add(g);
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acc.add(f);
  }

  void edges() {
    if (pos.x > width - r) {
      pos.x = width - r;
      vel.x *= -0.83;
    } else if (pos.x < r) {
      pos.x = r;
      vel.x *= -0.83;
    }

    if (pos.y > height + r) {
      pos.y = -r;
    } else if (pos.y < -r) {
      pos.y = height + r;
    }
  }

  void update() {
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
  }

  void render() {
    fill(127);
    stroke(255);
    strokeWeight(2);
    ellipse(pos.x, pos.y, r * 2, r * 2);
  }
}
