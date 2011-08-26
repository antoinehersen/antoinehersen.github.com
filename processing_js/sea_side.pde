color background_color;
color rock_color;
float seed;
int perlin_octave;


void setup() {
  size(screen.width, screen.height  );
  colorMode(HSB, 360.0, 1.0, 1.0);
  background_color = color(180.0, 0.07, 0.85);
  background( background_color);
  seed = 0.0;
  rock_color = color(228, 0.79, 0.42);
  perlin_octave = 3;
  noiseDetail(perlin_octave);
  noStroke();
}

void mousePressed() {
  seed += 999;
  perlin_octave ++ ;
  noiseDetail(perlin_octave);
}

void draw_montain_line(float y) {
  fill(  color(228, 0.79, 1.0- 0.8 * y/height));

  beginShape();
  vertex(0, 50);
  int step = 1;
  for (int x = 0; x < width - step ; x+=step ) {
    float y_noise = 260* pow( noise(0.01* x, 0.02* y, seed), 1.2);
    vertex(x, - y_noise);
  }
  vertex( width, 50);
  endShape(CLOSE);

}

void draw() {
  background( background_color);
  pushMatrix();
  int y_step = 40;
    for (int y = 100; y <= height + 2*y_step; y += y_step) {
    translate(0, y_step);
    draw_montain_line(y);
  }
  popMatrix();
  seed += 0.01;

}

