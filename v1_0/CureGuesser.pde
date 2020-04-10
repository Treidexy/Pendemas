String guess = "";
boolean cureGuesserFullscreen = false;
int cureGuesserWidth = 500, cureGuesserHeight = 400;
CureGuesser CG = new CureGuesser();

class CureGuesser extends PApplet {
  void settings() {
    size(cureGuesserWidth, cureGuesserHeight);
    if (cureGuesserFullscreen) {fullScreen();}
    //println(cureKey);
  }
  
  void draw() {
    background(151, 0, 0);
    clues();
    if (cureKey.regionMatches(false, 0, guess, 0, guess.length())) {
      fill(0, 255, 0);
    } else {
      fill(255, 0, 0);
    }
    textSize(15);
    text(guess, 150, 100);
  }
  
  void keyReleased() {
    guess += key;
    char reloadKey = '`';
    if (key == reloadKey) {
      guess = "";
    } else if (keyCode == 8) {
      guess = guess.substring(0, guess.length());
    }
  }
}
