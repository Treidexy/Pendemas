boolean allInfected = false;

void displayInfections() {
  fill(255, 0, 0);
  textSize(15);
  if (!allInfected) {
    text((infections - immune) +"/" + (animals - immune) + " animals infected;\n" + dead + " dead;", 10, 25);
  } else {
    text("ALL animals infected;\n" + dead + " dead;", 10, 25);
  }
  fill(255, 255, 255);
  text(immune + " immune.", 10, 75);
}

void displayCureRate() {
  fill(0, 255, 0);
  textSize(15);
  text("Cure Rate: " + curePercentile + "%", 10, 100);
}

void check() {
  if (dead >= animals - immune) {
    lose();
  } if (infections <= 0) {
    win();
  }
  
  if (infections >= animals) {
    infections = animals;
    allInfected = true;
  } else {
    allInfected = false;
  }
  
  if (guess.equalsIgnoreCase(cureKey)) {
    win();
  }
}
