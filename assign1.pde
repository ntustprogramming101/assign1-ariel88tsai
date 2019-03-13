PImage bg;
PImage groundHog;
PImage life;
PImage robot;
PImage soil;
PImage soldier;
float soldierX;
float soldierY;
float robotX;
float robotY;
float laserX;
float laserY;
float laserLength = 0;
float laserMaxLength = 40;

void setup() {
  size(640, 480, P2D);
  bg = loadImage("img/bg.jpg");
  groundHog = loadImage("img/groundhog.png");
  life = loadImage("img/life.png");
  soil = loadImage("img/soil.png");
  soldier = loadImage("img/soldier.png");
  soldierY = 160+ 80 * floor(random(0,3));
  robot = loadImage("img/robot.png");
  robotY = 160 + 80*floor(random(1,4));
  robotX = random(160,560);
  laserX = robotX + 25;
  laserY = robotY + 37;
}

void draw() {
  background(bg);
  
  //grass
  noStroke();
  fill(124,204,25);
  rect(0,145,640,15);
  
  //sun
  fill(255,255,0);
  ellipse(590,50,130,130);
  fill(253,184,19);
  ellipse(590,50,120,120);
  
  //groundHog
  imageMode(CENTER);
  image(groundHog,320,120);
  
  //life*3
  imageMode(CORNER);
  image(life,10,10);
  image(life,80,10);
  image(life,150,10);
  
  //soil
  image(soil,0,160);
  
  //soldier animation
  
  image(soldier,soldierX-80,soldierY);
  soldierX = (soldierX + 4) % 720;
  
  //robot
  imageMode(CORNER);
  image(robot,robotX,robotY);
  
  //laser animation
  stroke(255,0,0);
  strokeWeight(10);
  line(laserX,laserY,laserX+laserLength,laserY);
  laserLength = min(laserLength+2,laserMaxLength);
  laserX -= 2; 
  
  if(laserX <= robotX-160+25){
    laserX = robotX + 25;laserLength = 0 ;
  }
}
