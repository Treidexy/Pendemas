float spreadChance = 1000;
float deathChance = 4545;
int immune = 0;

class Virus {
  Virus() {
    infections++;
 }
}

void attack() {
  for(int i = 0; i < (infections - dead - immune); i++) {
    float mortality =  random(0, deathChance);
    if (mortality <= 1) {
      dead++;
    }
  }
}

void spread() {
  for (int i = 0; i < (infections - dead - immune); i++) {
    float spreadChanceR = random(0, spreadChance);
    if (spreadChanceR <= 1) {
      new Virus();
    }
  }
}
