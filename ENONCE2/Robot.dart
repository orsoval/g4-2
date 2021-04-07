void main() {
  // premier robot
  Robot robot1 = new Robot("Sumayat", 100, 3, 1, 4);
  // second robot
  Robot robot2 = new Robot("Bedios", 70, 2, 0, 2);
  // troisième robot
  Robot robot3 = new Robot("Pepeno", 30, 3, 2, 0);
  // quatrième robot
  Robot robot4 = new Robot("Kouloulou", 50, 3, 1, 3);
  //
  // Presentation des robot1 & robots 2
  robot1.presentation();
  robot2.presentation();
  //
  // Creation du tableau et presentation des robots avec la boucle for
  List<Robot> robots = [robot1, robot2, robot3, robot4];
  for (var x = 0; x < robots.length; x++) {
    robots[x].presentation();
  }
}

// la class robot
class Robot {
  int x = 0;
  int y = 0;
  String nom = "";
  int vie = 0;
  int vitesse = 0;

  // Construteur robot
  Robot(String nom, int vie, int vitesse, int x, int y) {
    this.nom = nom;
    this.vie = vie;
    this.vitesse = vitesse;
    this.x = x;
    this.y = y;
  }
  // methode de presentation
  void presentation() {
    print(
        "Bonjour je m'appelle ${this.nom}. J'ai ${this.vie} points de vie et je me déplace à ${this.vitesse} cases par seconde. Je suis à la case de coordonnées (${this.x};${this.y}) ");
  }

  void seDeplacerVers() {}
}
