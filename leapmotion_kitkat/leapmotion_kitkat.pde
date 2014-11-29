
import com.onformative.leap.LeapMotionP5;
import com.leapmotion.leap.Hand;
import com.leapmotion.leap.Finger;

LeapMotionP5 leap;

color center, edge, bg;

Hand h;

float pitch, roll, yaw, leap_height;
PImage kk_front, kk_side;
PFont f;

PImage kitkat, wrapper, logo;

int millisThreshold = 1000;

int startMillis;

int MODE = 0;

String texts[] = {
  "  You deserve a break!",
  "Take one..",
  "Have a break..",
  "Have a KitKat.."
};

final int RESET          = 0;
final int FOUR_FINGERS   = 1;
final int SPLASH         = 2;
final int ONE_FINGER     = 3;
final int BROKEN         = 4;
final int SPLASH2        = 5;

public void setup() {
  size(displayWidth, displayHeight, P3D);
  leap = new LeapMotionP5(this);
  //  textSize(32);

  center = color(187, 7, 2);
  edge = color(158, 29, 10);
  
  bg = color(228, 0, 49);

  kk_front = loadImage("textures/front.png");
  kk_side = loadImage("textures/side.png");
  textureMode(NORMAL);

  kitkat = loadImage("final.png");
  wrapper = loadImage("first.png");
  logo = loadImage("logo.png");

  f = loadFont("FranklinGothic-MediumItalic-96.vlw");
  textFont(f, 64);
}

public void draw() {
  background(bg);
  
//  image(logo, width/2 - 50, 0, 100, 100 );
  image(logo, 20, 0, 50, 50 );
  
  //kitkat();
  //fill(255, 127);

  if (leap.getHandList().size() == 1) {
    h = leap.getHandList().get(0);
    pitch = -(leap.getPitch(h)/50);
    roll = -(leap.getRoll(h)/50);
    yaw = -(leap.getYaw(h)/100);
    leap_height = leap.getSphereRadius(h);
  }

  switch(MODE) {
  case RESET:

    num_of_kitkats = 4;
    // place hand in front of leap to begin..

    text(texts[0], width/4, height/4);
    image(wrapper, width/3, height/2 - kitkat.height/3);
    //text((millis() - startMillis) + "", 300, 300);
    if (leap.getHandList().size() > 0) {
      if (millis() - startMillis > millisThreshold)
        MODE = FOUR_FINGERS;
    } else {
      startMillis = millis();
    }
    break;

  case SPLASH:
    text(texts[1], width/4, height/2);
    if (millis() - startMillis > millisThreshold * 3)
      MODE = ONE_FINGER;
    break;

  case FOUR_FINGERS:
  
    text(texts[1], width/3, height/4);

    theObject();

    if ( leap.getFingerList().size() == 1) {
      if (millis() - startMillis > millisThreshold) {
        MODE = ONE_FINGER;
        num_of_kitkats = 1;
      }
    } else {
      startMillis = millis();
    }
    break;


  case ONE_FINGER:
  
    text(texts[2], width/3, height/4);
    theObject();
    if (leap.getHandList().size() == 2) {
      if (millis() - startMillis > millisThreshold) {
        MODE = BROKEN;
      }
    } else {
      startMillis = millis();
    }
    break;

  case BROKEN:
    text(texts[3], width/3, height/2 + 20);
    image(kitkat, width/2 - kitkat.width/2, height/2 - kitkat.height/2);
    if (leap.getHandList().size() == 0) {
      if (millis() - startMillis > millisThreshold * 3)
        MODE = RESET;
      break;
    }
  }
  
//  println(leap_height);
}

public void stop() {
  leap.stop();
}

