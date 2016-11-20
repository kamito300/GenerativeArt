import processing.opengl.*;

float[] radiuses;
float[] lenses;
int count = 0;

void setup() {
  //size(828,315, P3D);
  size(1024,1024, P3D);
  background(255);
  stroke(0);
  radiuses = new float[180];
  lenses = new float[180];
  for(int i=0; i < 180; i+=1) {
    lenses[i] = random(50);
    radiuses[i] = random(300);
  }
  frameRate(40);
}

void draw() {
  background(255);
  translate(width / 3, height / 2, 0);
  //rotateY(20 + 0.03 * frameCount);
  //rotateX(30 + 0.02 * frameCount);
  rotateY(120);
  rotateX(120);
  
  float z = -180;
  int i = 0;
  float radius;
  
  while(z < 180) {
    z += random(10);
    //z += 10;
    radius = radiuses[i];
    particle(radius, z, lenses[i]);
    radiuses[i] += (frameCount % 300) * 0.1;
    if(radiuses[i] > 300) {
      radiuses[i] = 1;
    }
    i += 1;
  }
  count += 1;
}

void particle(float radius, float z, float lens) {
    for(float theta = 0; theta < 360; theta += 5) {
      float angle = radians(theta);
    
      float x = 0 + (radius * cos(angle));
      float y = 0 + (radius * sin(angle));
      float destX = 0 + ((radius + lens) * cos(angle));
      float destY = 0 + ((radius + lens) * sin(angle));
      
      stroke(100, 200, random(100, 255), random(255));
      strokeWeight(random(10));
      float delta = random(5);

      line(x, y, z, destX, destY, z);
    }
}