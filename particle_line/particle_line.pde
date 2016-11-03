import processing.opengl.*;

float radius = 100;

void setup() {
  size(500, 500, OPENGL);
  background(255);
  stroke(0);
  frameRate(5);
}

void draw() {
  background(255);
  translate(width / 3, height / 2, 0);
  rotateY(20 + 0.03 * frameCount);
  rotateX(30 + 0.02 * frameCount);
  
  float theta = 0;
  float z = -180;

  while(z < 180) {
    z += random(10);    
    radius = random(300);

    for(theta = 0; theta < 360; theta += 5) {
      float angle = radians(theta);
    
      float lens = random(80);
      float x = 0 + (radius * cos(angle));
      float y = 0 + (radius * sin(angle));
      float destX = 0 + ((radius + lens) * cos(angle));
      float destY = 0 + ((radius + lens) * sin(angle));
      
      stroke(100, 200, random(100, 255), random(255));
      strokeWeight(random(10));
      float delta = random(5);

      line(x + delta, y + delta, z, destX, destY, z);
    }
  }
}