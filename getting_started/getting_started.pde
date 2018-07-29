import org.openkinect.processing.*;

Kinect kinect;

boolean infraRed = false;
boolean colorDepth = false;

void setup() {
  //size(640, 480, P3D);
  size(1280, 520);
  kinect = new Kinect(this);
  kinect.initDepth();
  kinect.initVideo();
}

void draw() {
  //PImage img = kinect.getDepthImage();
  ////kinect.enableIR(true);
  ////mage img = kinect.getVideoImage();
  //image(img, 0, 0);

  background(0);
  image(kinect.getVideoImage(), 0, 0);
  image(kinect.getDepthImage(), 640, 0);
  fill(255);

/*
  int skip = 20;
  for (int x = 0; x < img.width; x+=skip) { 
    for (int y = 0; y < img.height; y+=skip) {
      int index = x + y * img.width;
      float brightnessValue = brightness(img.pixels[index]);
      float z = map(brightnessValue, 0, 255, 250, -250);
      fill(255 - brightnessValue);
      pushMatrix();
      translate(x, y, z);
      rect(0, 0, skip/2, skip/2);
      popMatrix();
    }
  }
*/

  text(
    "Press 'i' to enable/disable between video image and IR image,  " +
    "Press 'c' to enable/disable between color depth and gray scale depth,  " +
    "UP and DOWN to tilt camera   " +
    "Framerate: " + int(frameRate), 10, 515);
}

void keyPressed() {
  if (key == 'i') {
    infraRed = !infraRed;
    kinect.enableIR(infraRed);

  } else if (key == 'c') {
    colorDepth = !colorDepth;
    kinect.enableColorDepth(colorDepth);
  }
}
