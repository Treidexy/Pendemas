String name;
String author;
boolean displayCredits;

String pluginFolderPath = "/plugins/default/";

void PluginHandler() {
  pluginFolderPath = config.getString("plugin-folder");
  JSONObject plugin = loadJSONObject(pluginFolderPath + "plugin.json");
    JSONObject about = plugin.getJSONObject("about");
      name = about.getString("name");
      author = about.getString("author");
    JSONObject screen = plugin.getJSONObject("screen");
        fullscreen = screen.getBoolean("fullscreen");
        screenWidth = screen.getInt("width");
        screenHeight = screen.getInt("height");
    JSONObject gameplay = plugin.getJSONObject("gameplay");
      animals = gameplay.getInt("animals");
      infections = gameplay.getInt("start-infections");
      spreadChance = gameplay.getFloat("spread-chance");
      deathChance = gameplay.getFloat("death-chance");
      immune = gameplay.getInt("immune");
      fps = gameplay.getInt("fps");
      playSong = gameplay.getBoolean("play-song");
    songPath = plugin.getString("song-path");
    if (songPath.substring(0, 6).equalsIgnoreCase("$main/")) {
      songPath = songPath.substring(6, songPath.length());
    } else {
      songPath = pluginFolderPath + songPath;
    }
    println(songPath);
  JSONObject pluginConfig = loadJSONObject(pluginFolderPath + "config.json");
    displayCredits = pluginConfig.getBoolean("display-credits");
    boolean enableCustomCodes = pluginConfig.getBoolean("enable-custom-codes");
  if (enableCustomCodes) {
    JSONArray codesDirs = loadJSONArray(pluginFolderPath + "codes.json");
    for (int i = 0; i < codesDirs.size(); i++) {
      CodeHandler(codesDirs.getJSONObject(i));
    }
  }
}

void displayPluginCreds() {
  fill(0, 25, 255);
  textSize(15);
  if (name == null || author == null || displayCredits == false) {} else {
    text(name + "\n  By: " + author, 10, height - 45);
  }
}
