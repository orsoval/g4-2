import 'dart:math';

void main() {
  // premier robot
  Robot robot1 = new Robot("Sumayat", 100, 3, 0, 0);
  // second robot
  Robot robot2 = new Robot("Bedios", 100, 3, 0, 0);
  // troisième robot
  Robot robot3 = new Robot("Pepeno", 100, 3, 0, 0);
  // quatrième robot
  Robot robot4 = new Robot("Kouloulou", 100, 3, 0, 0);
  //
  // Presentation des robot1 & robots 2
  robot1.presentation();
  robot2.presentation();

  print("---------------------------");
  //
  // robots sont deplacer dans toutes les directions au choix
  print(robot1.seDeplacerVers("haut", 1));
  print(robot2.seDeplacerVers("bas", 1));
  print(robot3.seDeplacerVers("gauche", 1));
  print(robot4.seDeplacerVers("droite", 1));
  //
  //  Presentation des robots dans des cases aux coordonnées differentes
  robot1.presentation();
  robot2.presentation();
  robot3.presentation();
  robot4.presentation();

  print("----------------------");

  // robots sont deplacer aletoirement
  robot1.seDeplacerAleatoirement(4);
  print("----------------------");
  robot2.seDeplacerAleatoirement(4);
  print("----------------------");
  robot3.seDeplacerAleatoirement(4);
  print("----------------------");
  robot4.seDeplacerAleatoirement(4);

  print("----------------------");

  // fait parler les robots pour verifier si ils ont vraiment bougés
  robot1.presentation();
  robot2.presentation();
  robot3.presentation();
  robot4.presentation();

  print("----------------------");

  //  Second constructeur
  // Creation des robot et des objet avec differentes caractéristiques
  Robot RobotA = new Robot.constructeur("Charle", 90, 3, 1, 0);
  Robot RobotB = new Robot.constructeur("Bebeto", 50, 2, 0, -1);
  Robot RobotC = new Robot.constructeur("Kong", 10, 1, 0, 1);
  Robot RobotD = new Robot.constructeur("merux", 30, 2, -1, 0);

  // Robos mechants generé
  Mechant mechant1 = new Mechant("Kali", 100, 0, 1, 3, 0, true);
  Mechant mechant2 = new Mechant("Parrot", 100, 1, 0, 3, 0, true);
  Mechant mechant3 = new Mechant("NetHunter", 100, 0, -1, 3, 0, false);
  Mechant mechant4 = new Mechant("termux", 100, -1, 0, 3, 0, false);

  // test de la methode attaquer sur robot mechant1
  mechant1.attaquer();
  mechant1.attaquer();
  mechant1.attaquer();
  mechant1.attaquer();
}

// la class robot
class Robot {
  int x = 0;
  int y = 0;
  String nom = "";
  int vie = 0;
  int vitesseMax = 3;

  // Construteur par defaut robot
  Robot(this.nom, this.vie, this.vitesseMax, this.x, this.y);

  // second constructeur nommé constructeur
  Robot.constructeur(this.nom, this.vie, this.vitesseMax, this.x, this.y);

  // methode de presentation
  void presentation() {
    print(
        "Bonjour je m'appelle ${this.nom}. J'ai ${this.vie} points de vie et je me déplace à ${this.vitesseMax} cases par seconde. Je suis à la case de coordonnées (${this.x};${this.y}) ");
  }

  //
  // Fonction seDeplacerVers()
  String seDeplacerVers(String direction, int deplacement) {
    if (deplacement >= 1 && deplacement <= vitesseMax) {
      switch (direction) {
        case "haut":
          {
            this.y = this.y + deplacement;
            return "---deplacement de $deplacement case vers le haut effectuer---\n";
          }
        case "bas":
          {
            this.y = this.y - deplacement;
            return "---deplacement de $deplacement case vers le bas effectuer---\n";
          }
        case "gauche":
          {
            this.x = this.x - deplacement;
            return "---deplacement de $deplacement case vers la gauche effectuer---\n";
          }
        case "droite":
          {
            this.x = this.x + deplacement;
            return "---deplacement de $deplacement case vers la droite effectuer---\n";
          }
        default:
          {
            return "";
          }
      }
    } else {
      return "le nombre de case doit etre compris entre 1 et la vitesse max(${this.vitesseMax})";
    }
  }

  //
  // Fonction seDeplacerAleatoirement
  void seDeplacerAleatoirement(int nombreDeCoup) {
    for (var i = 0; i < nombreDeCoup; i++) {
      //pour generer le nombre de pas au hasard
      var c = Random();
      int nbrDePas = c.nextInt(vitesseMax + 1);

      // pour generer une direction au hasard
      List directionPossible = ["haut", "bas", "gauche", "droite"];
      var randomGenerator = Random();
      var direction = randomGenerator.nextInt(directionPossible.length);

      //simuler deplacement avec la fonction seDeplacerVers()
      print(
          "je me deplace une fois vers le(la) ${directionPossible[direction]} de $nbrDePas case");
      seDeplacerVers(directionPossible[direction], nbrDePas);
    }
  }

  void attaquer() {
    print("attaque en cours ...");
  }
}

//
// Class Mechant
class Mechant extends Robot {
  int pointDeDommage = 0;
  bool degats = true;

  Mechant(String nom, int vie, int x, int y, int vitesseMax, int pointDeDommage,
      bool degats)
      : super(nom, vie, x, y, vitesseMax) {
    this.nom = nom;
    this.vie = vie;
    this.x = x;
    this.y = y;
    this.vitesseMax;
  }

// Methode attaquer
  @override
  void attaquer() {
    super.attaquer();
    this.pointDeDommage;
    this.nom;
    this.x;
    this.y;
    this.degats;

    switch (this.degats) {
      case true:
        if (this.x > 0 || this.y > 0) {
          this.pointDeDommage++;
          print(
              "La cible  a été touché à distance son point de dommage  a augmentéé : $pointDeDommage ");
        } else {
          print("La cible  est trop loin pour etre attaqué");
        }
        break;
      case false:
        if (this.x < 0 || this.y < 0) {
          pointDeDommage++;
          print(
              "La cible ${this.nom} a été touché corps à corps son point de dommage  a diminué : $pointDeDommage ");
        } else {
          print("La cible ${this.nom} est trop pret pour etre attaqué");
        }
        break;
      default:
    }
  }
}
