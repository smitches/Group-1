class Flock {
  ArrayList<Prey> preys; 
  Flock() {
    preys = new ArrayList<Prey>();
  }
  void addPrey(Prey p) {
    preys.add(p);
  }
  void run() {
    for (Prey p: preys){
      p.run(this);
    }
  }
}

class Prey{
  float x,y,r;
  PVector v;  
  Prey(float x,float y,PVector v)
  {
    this.x = x;
    this.y = y;
    this.v = v;
    this.r = 2;
 }
 void borders() {
    if (this.x < -r) this.x = width;
    if (this.y < -r) this.y = height;
    if (this.x > width+r) this.x = r;
    if (this.y > height+r) this.y = r;
  }
  void render() {
    float theta = this.v.heading2D() +  radians(90);
    fill(200, 100);
    stroke(255);
    pushMatrix();
    translate(this.x, this.y);
    rotate(theta);
    beginShape(TRIANGLES);
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape();
    popMatrix();
  }
  void update(Flock flock){
    PVector vel = Together(this, flock);
    print(vel);
    this.v = vel;
  }
  void Move(){
    this.x+=v.x;
    this.y+=v.y;
  }
  void run(Flock flock) {
    update(flock);
    Move();
    borders();
    render();
  }
}

PVector Alignment(Prey prey, Flock flock) {
    PVector vel = new PVector(0,0);
    float nc = 0;
    for (Prey bird : flock.preys) {
      if (bird != prey) {
        if (dist(bird.x,bird.y,prey.x,prey.y) < 30) {
          vel.x += bird.v.x;
          vel.y += bird.v.y;
          nc += 1;
        }
      }
    }
    if (nc == 0) {
      return vel;
    }
    vel.x = vel.x / nc;
    vel.y = vel.y / nc;
    vel = vel.normalize();
    return vel;
}

PVector Cohesion(Prey prey, Flock flock) {
  PVector COM = new PVector(0,0);
  float nc = 0;
  for (Prey bird : flock.preys) {
    if (bird != prey) {
      if (dist(bird.x, bird.y, prey.x, prey.y) < 30){
        COM.x += bird.x;
        COM.y += bird.y;
        nc +=1;
      }
    }
  }
  if (nc == 0) {
    return prey.v;
  }
  COM.x /= nc;
  COM.y /= nc;
  COM.x -= prey.x;
  COM.y -= prey.y;
  COM = COM.normalize();
  return(COM);
    
}

PVector Separation(Prey prey, Flock flock) {
    PVector vel = new PVector(0,0);
    float nc = 0;
    for (Prey bird : flock.preys) {
      if (bird != prey) {
        if (dist(bird.x,bird.y,prey.x,prey.y) < 30) {
          vel.x += bird.x - prey.x;
          vel.y += bird.y - prey.y;
          nc += 1;
        }
      }
    }
    if (nc == 0) {
      return vel;
    }
    vel.x = vel.x / nc;
    vel.y = vel.y / nc;
    vel.x *= -1;
    vel.y *= -1;
    vel = vel.normalize();
    return vel;
}

PVector Together(Prey prey, Flock flock) {
  PVector vel = new PVector(0,0);
  PVector velA = Alignment(prey, flock);
  PVector velC = Cohesion(prey, flock);
  PVector velS = Separation(prey, flock);
  prey.v.x += velA.x + velC.x + velS.x;
  prey.v.y += velA.y + velC.y + velS.y;
  vel = prey.v.normalize();
  return vel;
}