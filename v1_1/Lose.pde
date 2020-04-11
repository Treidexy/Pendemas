String loseText = "You Lost\n:(";
boolean loseFullscreen = false;
int loseWidth = 1000, loseHeight = 800;

class Lose extends PApplet {
  void settings() {
    size(loseWidth, loseHeight);
    if (loseFullscreen) {fullScreen();}
  }
  
  void draw() {
    background(255, 0, 0);
    fill(0, 255, 255);
    textAlign(CENTER, CENTER);
    textSize(width/10);
    text(loseText, width/2, height/2);
  }
}
void lose() {
  background(255, 0, 0);
  CG.frame.setVisible(false);
  surface.setVisible(false);
  PApplet.runSketch(args, new Lose());
  frameRate(0);
}
