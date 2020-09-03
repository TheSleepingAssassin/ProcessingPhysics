class Ball {
  PVector pos, vel, acc;
  float r, mass, mu;
  Ball(PVector pos, float mass) {
    this.pos = pos;
    this.vel = new PVector();
    this.acc = new PVector();
    this.mass = mass;
    this.r = sqrt(this.mass) * 10;
    mu = 0.1;
  }

  void run() {
    render();
    update();
    applyG();
    bounce();
    friction();
  }

  void friction() {
    float diff = height - (pos.y + r);
    if (diff < 1) {
      PVector f = vel.copy();
      f.normalize();
      f.mult(-1);

      float normal = mass;
      f.setMag(mu * normal);
      applyForce(f);
    }
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

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acc.add(f);
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
