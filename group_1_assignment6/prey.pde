class Flock {
  ArrayList<Prey> preys; // An ArrayList for all the boids

  Flock() {
    preys = new ArrayList<Prey>(); // Initialize the ArrayList
  }

  void addPrey(Prey p) {
    preys.add(p);
  }
}

class Prey{
  float x,y;
  PVector v;  
  Prey(float x,float y,PVector v)
  {
    this.x = x;
    this.y = y;
    this.v = v;
 }
}

PVector Alignment(Prey prey, ArrayList<Prey> arrlist) {
    PVector vel = new PVector(0,0);
    float nc = 0;
    for (Prey bird : arrlist) {
      if (bird != prey) {
        if ((bird.v).dist(prey.v) < 300) {
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

PVector Cohesion(Prey prey, ArrayList<Prey> arrlist) {
    PVector vel = new PVector(0,0);
    float nc = 0;
    for (Prey bird : arrlist) {
      if (bird != prey) {
        if ((bird.v).dist(prey.v) < 300) {
          vel.x += bird.x;
          vel.y += bird.y;
          nc += 1;
        }
      }
    }
    if (nc == 0) {
      return vel;
    }
    vel.x = vel.x / nc;
    vel.y = vel.y / nc;
    vel = new PVector(vel.x-prey.x, vel.y - prey.y);
    vel = vel.normalize();
    return vel;
}

PVector Separation(Prey prey, ArrayList<Prey> arrlist) {
    PVector vel = new PVector(0,0);
    float nc = 0;
    for (Prey bird : arrlist) {
      if (bird != prey) {
        if ((bird.v).dist(prey.v) < 300) {
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

void Together(Prey prey, ArrayList<Prey> arrlist) {
  PVector velA = Alignment(prey, arrlist);
  PVector velC = Cohesion(prey, arrlist);
  PVector velS = Separation(prey, arrlist);
  prey.v.x += velA.x + velC.x + velS.x;
  prey.v.y += velA.y + velC.y + velS.y;
  prey.v.normalize();
}