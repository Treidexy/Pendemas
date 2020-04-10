String configText = "{\n\t\"screen\": {\n\t\t\"fullscreen\": false,\n\t\t\"width\": 1000,\n\t\t\"height\": 800\n\t},\n\t\"gameplay\": {\n\t\t\"animals\": 1000000,\n\t\t\"start-infections\": 11,\n\t\t\"immune\": 0,\n\t\t\"fps\": 120,\n\t\t\"play-song\": false,\n\t\t\"enable-plugins\": true\n\t},\n\t\"song-path\": \"/PendemasTheme.mp3\",\n\t\"plugin-folder\": \"/plugins/default/\",\n\t\"comments\": \"Plugins overrite this data!\"\n}";

String defaultPlugin = "{\n\t\"about\": {\n\t\t\"name\": \"Default Plugin\",\n\t\t\"author\": \"Treidex\"\n\t},\n\t\"screen\": {\n\t\t\"fullscreen\": false,\n\t\t\"width\": 1000,\n\t\t\"height\": 800\n\t},\n\t\"gameplay\": {\n\t\t\"animals\": 1000000,\n\t\t\"start-infections\": 11,\n\t\t\"fps\": 60,\n\t\t\"spread-chance\": 1000,\n\t\t\"death-chance\": 6969,\n\t\t\"immune\": 0,\n\t\t\"play-song\": false\n\t},\n\t\"song-path\": \"$main/PendemasTheme.mp3\",\n\t\"comments\": \"code: 'screens' overrites 'screen'\"\n}";
String defaultPluginConfig = "{\n\t\"display-credits\": true,\n\t\"enable-custom-codes\": false\n}";
String defaultCodes = "[\n\t{\n\t\t\"type\": \"cure\",\n\t\t\"url\": \"codes/cure.json\"\n\t},\n\t{\n\t\t\"type\": \"scenario\",\n\t\t\"url\": \"codes/scenario.json\"\n\t},\n\t{\n\t\t\"type\": \"scenario_chances\",\n\t\t\"url\": \"codes/scenario_chances.json\"\n\t},\n\t{\n\t\t\"type\": \"screens\",\n\t\t\"url\": \"codes/screens.json\"\n\t}\n]";
String defaultCureCode = "{\n\t\"cure-rate\": 0,\n\t\"cure-rate-completion\": 100,\n\t\"cure-rate-multiplier\": 1,\n\t\"cure-rate-multiplier-increament\": 0.75,\n\t\"cure-check-start\": 100,\n\t\"cure-check-multiplier-range\": [0.069, 0.14],\n\t\"cure-key-length\": 6,\n\t\"cure-key-characters\": \"abcdefghijklmnopqrstuvwxyz1234567890\",\n\t\"progress-chance\": 10\n}";
String scenarioCode = "{\n\t\"animal_shootings-range\": [15, 151],\n\t\"immunity_count-range\": [1, 25],\n\t\"pandemic_multiplier\": 2,\n\t\"mutation_impact\": 3,\n\t\"bacterial_damage\": 100,\n\t\"suffocation\": 0\n}";
String scenarioChancesCode = "{\n\t\"animal_shootings\": 100,\n\t\"immunity\": 1000,\n\t\"double_pandemic\": 10000000,\n\t\"mutation\": 100000000,\n\t\"bacterial_win\": 10000000000,\n\t\"suffocation\": 1000000000000,\n\t\"earth_eruption\": 1000,\n\t\"alien_invasion\": 1000000000000000000\n}";
String screensCode = "{\n\t\"main\": {\n\t\t\"fullscreen\": false,\n\t\t\"width\": 1000,\n\t\t\"height\": 800\n\t},\n\t\"cure-guesser\": {\n\t\t\"fullscreen\": false,\n\t\t\"width\": 500,\n\t\t\"height\": 400\n\t},\n\t\"win\": {\n\t\t\"fullscreen\": false,\n\t\t\"width\": 1000,\n\t\t\"height\": 800\n\t},\n\t\"lose\": {\n\t\t\"fullscreen\": false,\n\t\t\"width\": 1000,\n\t\t\"height\": 800\n\t}\n}";


void install() {
  PrintWriter out;
  
  //writes the files
    //config file
    out = createWriter("config.json");
    out.print(configText);
    out.flush();
    out.close();
    //default plugin file
    out = createWriter("plugins/default/plugin.json");
    out.print(defaultPlugin);
    out.flush();
    out.close();
    //default plugin configs file
    out = createWriter("plugins/default/config.json");
    out.print(defaultPluginConfig);
    out.flush();
    out.close();
    //default plugin code file
    out = createWriter("plugins/default/codes.json");
    out.print(defaultCodes);
    out.flush();
    out.close();
    //default cure code file
    out = createWriter("plugins/default/codes/cure.json");
    out.print(defaultCureCode);
    out.flush();
    out.close();
    //default scenario code file
    out = createWriter("plugins/default/codes/scenario.json");
    out.print(scenarioCode);
    out.flush();
    out.close();
    //default scenario chances file
    out = createWriter("plugins/default/codes/scenario_chances.json");
    out.print(scenarioChancesCode);
    out.flush();
    out.close();
    //default screens file
    out = createWriter("plugins/default/codes/screens.json");
    out.print(screensCode);
    out.flush();
    out.close();
}
