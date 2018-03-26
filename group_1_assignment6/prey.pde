class Prey {
  float x,y;
  PVector v;  
  Prey(float x,float y,PVector v)
  {
    this.x = x;
    this.y = y;
    this.v = v;
 }
}

PVector Alignment(prey, ArrayList<Prey> arrlist) {
    PVector vel = new PVector(0,0);
    var nc = 0;
    for (Integer bird : arrlist) {
      if (bird != prey) {
        if (bird.dist(prey) < 300) {
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

PVector Cohesion(prey, arrlist) {
    PVector vel = new PVector(0,0);
    var nc = 0;
    for (Integer bird : arrlist) {
      if (bird != prey) {
        if (bird.dist(prey) < 300) {
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

PVector Separation(prey, arrlist) {
    PVector vel = new PVector(0,0);
    var nc = 0;
    for (Integer bird : arrlist) {
      if (bird != prey) {
        if (bird.dist(prey) < 300) {
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