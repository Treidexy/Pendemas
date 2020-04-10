//Pendemas by Treidex
// _______________
// |_____   ______|
//       | |
//       | |
//       | |
//       | |  _
//       | | //
//       | |//
//       |__/
/*
  * plugins overwrite config.json
  * if you don't have config.json or your plugin is invalid
    * settings will go back to defaults
    * your plugin is still untouched
    * verify your json, make sure it works
*/
//imports
import java.net.URL;
import processing.sound.*;

//default size
float blockWidth = 1, blockHeight = 1;
//virus stuff - determined in config.json
int dead = 0, animals = 1000000, infections = 11, fps;

//fullscreen - determind in config.json
boolean fullscreen;
//screen dimensions - determined in config.json
int screenWidth = 1000, screenHeight = 800;
//SONGS!!!
Sound s;
SoundFile song;
boolean playSong = false;
String songPath = "/PendemasTheme.mp3";
String[] args = {""};

JSONObject config;

public void settings() {
  try {
  config = loadJSONObject("config.json");
    JSONObject screen = config.getJSONObject("screen");
      boolean fullscreen = screen.getBoolean("fullscreen");
      screenWidth = screen.getInt("width");
      screenHeight = screen.getInt("height");
    JSONObject gameplay = config.getJSONObject("gameplay");
      animals = gameplay.getInt("animals");
      infections = gameplay.getInt("start-infections");
      immune = gameplay.getInt("immune");
      fps = gameplay.getInt("fps");
      playSong = gameplay.getBoolean("play-song");
      boolean enablePlugins = gameplay.getBoolean("enable-plugins");
    if (enablePlugins) {
      PluginHandler();
    }
  } catch (RuntimeException e) {
    install();
    println(e);
  }
  size(screenWidth, screenHeight);
  if (fullscreen) {fullScreen();} 
}

void setup() {
  surface.setResizable(true);
  generateCureKey();
  if (playSong) {
    try {
      song = new SoundFile(this, songPath);
      song.play();
      song.amp(.4);
      song.loop();
    } catch (RuntimeException e) {
      println(e);
    }
  }
}

void draw() {
  //translate size
  blockWidth = ((float) width)/1000;
  blockHeight = ((float) height)/800;
  
  background(0);
  frameRate(fps);
  
  displayFPS();
  displayInfections();
  displayCureRate();
  displayScenario();
  displayPluginCreds();
  
  if (!allInfected) {
    spread();
  }
  attack();
  cureUpdate();
  
  check();
}

void exit() {
  println("closing...");
  super.exit();
}

void displayFPS() {
  fill(255, 255, 255);
  textSize(15);
  text((int) frameRate + " FPS", width - 75, 30);
}
