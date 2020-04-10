float cureRate = 0;
float cureRateCompletion = 100;
float curePercentile = (cureRate / cureRateCompletion) * 100;
float cureRateMultiplier = 1;
float cureRateMultiplierIncreament = 0.75;
float cureCheckStart = 100;
float cureCheckDeaths = cureCheckStart;
float[] cureCheckMultiplierRange = {0.069, 0.14};

String cureKeyString = "abcdefghijklmnopqrstuvwxyz1234567890";
char[] cureKeyCharacters = cureKeyString.toCharArray();
String cureKey = "";
int cureKeyLength = 6;

int cureCheck = 1;
boolean cureFull = false;

float progressChance = 7.6;

boolean GuesserOpened = false;

void cureUpdate() {
  curePercentile = (cureRate / cureRateCompletion) * 100;
  if (dead / cureCheckDeaths > cureCheck) {
    progress();
    
    cureCheckDeaths += cureCheckStart*random(cureCheckMultiplierRange[0], cureCheckMultiplierRange[0]);
    cureCheck++;
  }
  if (cureFull && GuesserOpened == false) {
    PApplet.runSketch(args, CG);
    GuesserOpened = true;
  }
}

void progress() {
  new Scenario();
  if (Scenario == "cure") {
    int increament = (int) random(0, progressChance * cureRateMultiplier);
    cureRateMultiplier += cureRateMultiplier*cureRateMultiplierIncreament;
    curePercentile += increament;
    
    cureRate += increament;
  }
  
  if(curePercentile >= 100) {
    curePercentile = 100;
    
    cureFull = true;
    return;
  }
}

String generateCureKey() {
  for (int i = 0; i < cureKeyLength; i++) {
    cureKey += cureKeyCharacters[(int) random(0, cureKeyCharacters.length)];
  }
  
  return cureKey;
}

void clues() {
  CG.fill(151, 151, 151);
  CG.textSize(11); //<>//
  CG.text("Length: " + cureKey.length() + "; Possible charactors:", 0, 10); //<>//
  for (int i = 0; i < cureKeyCharacters.length; i++) {
    CG.fill(151, 151, 151);
    CG.text(cureKeyCharacters[i], i*7, 35);
    for (int j = 0; j < cureKey.length(); j++) {
      if (cureKey.toCharArray()[j] == cureKeyCharacters[i]) {
        CG.fill(0, 255, 0);
        CG.text(cureKey.toCharArray()[j], i*7, 35);
      }
    }
  }
}
