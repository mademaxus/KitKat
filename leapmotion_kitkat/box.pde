int num_of_kitkats = 4;

void theObject() {

  noStroke();
  pushMatrix();
  translate(width/2, height/2, 0);
  //  stroke(255, 0, 0);
  noFill();
  rotateX(pitch); // up-down
  rotateY(yaw);
  rotateZ(roll);
  for (int i = 0; i < num_of_kitkats; i++) {
    pushMatrix();
//    translate(kk_w * (i-2), 0, map(leap_height, 50, 200, -200, 200));
    translate(kk_w + kk_w * (i-num_of_kitkats/2), 0);
    kitkat();
    popMatrix();
  }
  popMatrix();
  //shape(s, 0, 0);
  //  box(300, 100, 500);
}

int kk_w = 100/2;
int kk_h = int(kk_w * 0.546);
int kk_d = 839/2;

int kk_x = int(-kk_w/2);
int kk_y = int(-kk_h/2);
int kk_z = int(-kk_d/2); 

int kk_margin = int(kk_w * 0.146);


void kitkat() {

  // left
  beginShape();
  texture(kk_side);
  vertex(kk_x + kk_margin, kk_y, kk_z + kk_margin, 1, 0);
  vertex(kk_x + kk_margin, kk_y, kk_z + kk_d - kk_margin, 0, 0);
  vertex(kk_x, kk_y + kk_h, kk_z + kk_d, 0, 1);
  vertex(kk_x, kk_y + kk_h, kk_z, 1, 1);
  endShape();


  //right
  beginShape();
  texture(kk_side);
  vertex(kk_x + kk_w - kk_margin, kk_y, kk_z + kk_d - kk_margin, 1, 0);
  vertex(kk_x + kk_w - kk_margin, kk_y, kk_z + kk_margin, 0, 0);
  vertex(kk_x + kk_w, kk_y + kk_h, kk_z, 0, 1);
  vertex(kk_x + kk_w, kk_y + kk_h, kk_z + kk_d, 1, 1);
  endShape();

  //top
  beginShape();
  texture(kk_front);
  vertex(kk_x + kk_margin, kk_y, kk_z + kk_margin, 1, 0);
  vertex(kk_x + kk_margin, kk_y, kk_z + kk_d - kk_margin, 0, 0);

  vertex(kk_x + kk_w - kk_margin, kk_y, kk_z + kk_d - kk_margin, 0, 1);
  vertex(kk_x + kk_w - kk_margin, kk_y, kk_z + kk_margin, 1, 1);
  endShape(); 

  //bottom
  beginShape();
  texture(kk_side);
  vertex(kk_x + kk_w, kk_y + kk_h, kk_z, 0, 1);
  vertex(kk_x + kk_w, kk_y + kk_h, kk_z + kk_d, 1, 1);
  vertex(kk_x, kk_y + kk_h, kk_z + kk_d, 1, 0);
  vertex(kk_x, kk_y + kk_h, kk_z, 0, 0);
  endShape();

  // front
  beginShape();
  texture(kk_side);
  vertex(kk_x + kk_w, kk_y + kk_h, kk_z + kk_d, 1, 1);
  vertex(kk_x, kk_y + kk_h, kk_z + kk_d, 1, 0);
  vertex(kk_x + kk_margin, kk_y, kk_z + kk_d - kk_margin, 0, 0);
  vertex(kk_x + kk_w - kk_margin, kk_y, kk_z + kk_d - kk_margin, 0, 1);
  endShape();  

  // back
  beginShape();
  texture(kk_side);
  vertex(kk_x + kk_w, kk_y + kk_h, kk_z, 1, 1);
  vertex(kk_x, kk_y + kk_h, kk_z, 1, 0);
  vertex(kk_x + kk_margin, kk_y, kk_z + kk_margin, 0, 0);
  vertex(kk_x + kk_w - kk_margin, kk_y, kk_z + kk_margin, 0, 1);
  endShape();
}

