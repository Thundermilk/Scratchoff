PImage underneath;
PVector[] locVar;
int[] scratchoff;
int fullscreen;
int spot = 0;
int scaVar;
int divVar = 10;


void setup() {
  underneath = loadImage("Roxy_Pic2.png"); 
  surface.setResizable(true);
  surface.setSize(underneath.width,underneath.height);
  
  fullscreen = width*height;
  
  scaVar = (width/divVar)*(height/divVar);
  scratchoff = new int[scaVar];
  locVar = new PVector[scaVar];
  for (int i = 0; i < scaVar; i++) {
    scratchoff[i] = 255;
    }
  for (int x = 0; x < width/divVar; x++) {
    for (int y = 0; y < height/divVar; y++) {
      locVar[spot] = new PVector(x*divVar,y*divVar);
      //scratched[spot] = get(x,y);
      spot++;
    }
  }
}

void draw () {
  background(0);
  image (underneath,0,0);
  for (int i = 0; i < scaVar; i++) {
    //stroke(255);
    noStroke();
    fill(0,scratchoff[i]);
    rect(locVar[i].x,locVar[i].y,divVar,divVar);
    //fill(200);
    //text(i,locVar[i].x+20,locVar[i].y+20);
  }


  if (mousePressed == true) {
        for (int q = 0; q < scaVar; q++) {
          if ( (mouseX >= locVar[q].x) && (mouseX < locVar[q].x+divVar) ) {
            if ( (mouseY >= locVar[q].y) && mouseY < (locVar[q].y+divVar) ) {
                scratchoff[q] = 0;
                //fill(200,0,0);
                //text(q,locVar[q].x+10,locVar[q].y+10);
            }
          }
          //fill(200);
          //text(q,locVar[q].x+30,locVar[q].y+30);
          //println(mouseX/divVar + " " + mouseY/divVar + " " + q);
        }
  }
  
}