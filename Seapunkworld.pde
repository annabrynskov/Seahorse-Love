int space;
int [ ] sizes;
float gx, gy, bx, by;
String sign;
PFont font;
PImage seagrass, girl, boy, internet, heart, G, B;

void setup() {
  size (1000, 750);
  background (157, 221, 240);

  seagrass = loadImage ("seagrass.png");
  seagrass.resize (340, 0);
  girl = loadImage ("seahorsegirl.png");
  girl.resize (600, 0);
  boy = loadImage ("seahorseboy.png");
  boy.resize (650, 0);
  internet = loadImage ("internet_explorer_icon.png");
  internet.resize (60, 0);
  heart = loadImage ("heart.png");
  heart.resize (60, 0);
  G = loadImage ("G.png");
  G.resize (50, 0);
  B = loadImage ("B.png");
  B.resize (50, 0);

  gx = 250;
  gy = 400;
  bx = 700;
  by = 500;

  sizes = new int [8];

  sizes[0] = 10;
  sizes[1] = 20;
  sizes[2] = 100;
  sizes[3] = 60;
  sizes[4] = 110;
  sizes[5] = 70;
  sizes[6] = 15;
  sizes[7] = 30;

  space = height/(sizes.length+1);
}

void draw() {
  background (157, 221, 240);
  signatur();
  image(internet, 50, 50);

  imageMode(CORNER);
  //tangplanternes loop
  for (int i = 0; i < sizes.length; i++) {
    int x = space*(i);
    image(seagrass, sizes[i]+x, 400+sizes[i]);
  }

  imageMode(CENTER);
  seahorsegirl();
  seahorseboy();

  if (mousePressed) {
    internet();

    //seahorsegirl kan flyttes
    if (mouseX > gx - 120 && mouseX < gx + 120 && mouseY > gy - 155 && mouseY < gy + 155) {
      if (keyPressed && key == 'g') {
        gx = mouseX;
        gy = mouseY;
      }
    }

    //seahorseboy kan flyttes
    if (mouseX > bx-120 && mouseX < bx+120 && mouseY > by-155 && mouseY < by + 155) {
      if (keyPressed && key == 'b') {
        bx = mouseX;
        by = mouseY;
      }
    }
  }

  //positionernes udfald
  if (dist(bx, by, gx, gy) < 150 && dist(bx, by, gx, gy) > 115 && gx > bx && gy < by) {
    image(heart, gx-40, gy-185);
    image(heart, bx-30, by-205);
  } else {
    image(G, 780, 85);
    image(B, 910, 85);
    font = createFont("Helvetica", 15);
    textFont(font);
    fill(255);
    text("BRING THE SEAHORSES BACK TOGETHER", 640, 45);
    text("GIRL =                     BOY =", 700, 90);
  }
}

void signatur() {
  font = createFont("Courier", 12);
  textFont(font);
  fill(255);
  sign = "dj french girls";
  text(sign, int(random(880, 882)), int(random(738, 740)));
}

void seahorsegirl() {
  filter(INVERT);
  image(girl, gx, gy);
  filter(INVERT);
}

void seahorseboy() {
  filter(INVERT);
  image(boy, bx, by);
  filter(INVERT);
}

void internet() {
  if (mouseX > 25 && mouseX < 80 && mouseY > 25 && mouseY < 80) {
    gx = random(100, 400);
    gy = random(150, 680);
    bx = random(606, 906);
    by = random(235, 589);
  }
}