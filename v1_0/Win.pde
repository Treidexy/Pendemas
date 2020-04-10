String winText = "You Won!!!";
boolean winFullscreen = false;
int winWidth = 1000, winHeight = 800;

class Win extends PApplet {
  void settings() {
    size(winWidth, winHeight);
    if (winFullscreen) {fullScreen();}
  }
  
  void draw() {
    background(0, 255, 0);
    fill(255, 0, 255);
    textAlign(CENTER, CENTER);
    textSize(width/10);
    text(winText, width/2, height/2);
  }
}

void win() {
  surface.setVisible(false);
  CG.frame.setVisible(false);
  PApplet.runSketch(args, new Win());
  frameRate(0);
}
