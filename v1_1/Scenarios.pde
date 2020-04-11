String Scenario;

 int timer = 120;

long animalShootings = 100;
  int[] animalShootingsRange = {15, 151};
long immunity = 1000;
  int[] immunityCountRange = {1, 69};
long doublePandemic = 10000000;
  float pandemicMultiplier = 2;
long mutation = 100000000;
  float mutationImpact = 3;
long bacterialWin = 10000000000L;
  int bacterialDamage = 100;
long suffocation = 1000000000000L;
  boolean suffocated = false;
  long earthEruption = 1000;
long alienInvasion = 100000000000000000L;

class Scenario {
  Scenario() {
    if (random(0, animalShootings) <= 1) {
      if (random(0, immunity/animalShootings) <= 1) {
        if (random(0, doublePandemic/immunity) <= 1) {
          if (random(0, mutation/doublePandemic) <= 1) {
            if (random(0, bacterialWin/doublePandemic) <= 1) {
              if (random(0, suffocation/bacterialWin) <= 1) { //<>//
                if (random(0, alienInvasion/suffocation) <= 1) {
                  Scenario = "alien_invasion";
                } else {
                  Scenario = "suffocation";
                }
              } else if (random(0, earthEruption) <= 1 && suffocated) {
                Scenario = "earth_eruption";
              } else {
                Scenario = "bacterial_win";
              }
            } else {
              Scenario = "mutation";
            }
          } else {
            Scenario = "double_pandemic";
          }
        } else {
          Scenario = "immunity";
        }
      } else {
        Scenario = "animal_shootings";
      }
    } else {
      Scenario = "cure";
    }
    scenario();
  }
}

void scenario() {
  timer = 0;
  if (Scenario == "animal_shootings") {
    dead += (int) random(animalShootingsRange[0], animalShootingsRange[1]);
  } else if (Scenario == "immunity") {
    immune += (int) random(immunityCountRange[0], immunityCountRange[1]);
  } else if (Scenario == "double_pandemic") {
    spreadChance /= pandemicMultiplier;
  } else if (Scenario == "mutation") {
    cureRate /= mutationImpact;
  } else if (Scenario == "bacterial_win") {
    infections -= bacterialDamage;
  } else if (Scenario == "suffocation") {
    suffocated = true;
  } else if (Scenario == "earth_eruption") {
    lose();
  } else if (Scenario == "alien_invasion") {
    win();
  }
  
  if (Scenario != "cure") {
    println(Scenario);
  }
}

void displayScenario() {
  timer++;
  if (timer <= 120 && Scenario != "cure") {
    fill(0, 255, 0);
    textSize(50);
    textAlign(CENTER, CENTER);
    text("Rare Cases: " + Scenario + "!", width/2, height/2);
    textAlign(LEFT, TOP);
  }
}
