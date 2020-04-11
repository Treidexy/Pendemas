void CodeHandler(JSONObject info) {
  String type = info.getString("type");
  String URL = info.getString("url");
  
  JSONObject code = loadJSONObject(pluginFolderPath + URL);
  String scenarioChances = "scenario_chances";
    if (type.equals(scenarioChances)) {
      ScenarioChances(code);
    }
};

void ScenarioChances(JSONObject code) {
  println("code");
  animalShootings = code.getLong("animal_shootings");
  immunity = code.getLong("immunity");
  doublePandemic = code.getLong("double_pandemic");
  mutation = code.getLong("mutation");
  bacterialWin = code.getLong("bacterial_win");
  suffocation = code.getLong("suffocation");
  alienInvasion = code.getLong("alien_invasion");
}

void Cure(JSONObject code) {
  cureRate = code.getInt("cure-rate");
  cureRateCompletion = code.getFloat("cure-rate-completion");
  cureRateMultiplier = code.getFloat("cure-rate-multiplier");
  cureRateMultiplierIncreament = code.getFloat("cure-rate-multiplier-increament");
  cureCheckDeaths = code.getFloat("cure-check-start");
  JSONArray cureCheckMultiplierRangeJSON = code.getJSONArray("cure-check-multiplier-range");
    cureCheckMultiplierRange[0] = cureCheckMultiplierRangeJSON.getFloat(0);
    cureCheckMultiplierRange[1] = cureCheckMultiplierRangeJSON.getFloat(1);
  cureKeyLength = code.getInt("cure-key-length");
  cureKeyString = code.getString("cure-key-characters");
    cureKeyCharacters = cureKeyString.toCharArray();
  progressChance = code.getFloat("progress-chance");
}

void screens(JSONObject code) {
  JSONObject main = code.getJSONObject("main");
    fullscreen = main.getBoolean("fullscreen");
    screenWidth = main.getInt("width");
    screenHeight = main.getInt("height");
  JSONObject cureGuesser = code.getJSONObject("cure-guesser");
    cureGuesserFullscreen = main.getBoolean("fullscreen");
    cureGuesserWidth = main.getInt("width");
    cureGuesserHeight = main.getInt("height");
  JSONObject win = code.getJSONObject("win");
    winFullscreen = main.getBoolean("fullscreen");
    winWidth = main.getInt("width");
    winHeight = main.getInt("height");
  JSONObject lose = code.getJSONObject("lose");
    loseFullscreen = main.getBoolean("fullscreen");
    loseWidth = main.getInt("width");
    loseHeight = main.getInt("height");
}
