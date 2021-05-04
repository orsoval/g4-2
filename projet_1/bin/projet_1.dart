import 'dart:math';
import 'dart:io';

void main(List<String> arguments) {
  var i = 1;
  var run = true;
  var bot = Bot(1, 100);
  // creation d'objet de type player
  var player1 = Player('', 1, 100);

  print('Entrer votre pseudo : ');
  var pseudo = stdin.readLineSync();

  // Recuperer le pseudo demander dans l'objet player1
  player1.pseudo = pseudo;

  do {
    final r = Random();
    var choix = r.nextInt(2);

    switch (choix) {
      case 0:
        print('${player1.pseudo} Attaque en premier');
        print('----$pseudo Appuyer sur ENTRER pour lancer les dés----');
        stdin.readLineSync();
        attaquePlayerVersBot(player1, bot);
        infoBot(bot);
        attaqueBotVersPlayer(bot, player1);
        infoPlayer(player1);
        // Afficher les informations du player1
        break;
      default:
        print('Bot attaque en premier');
        attaqueBotVersPlayer(bot, player1);
        infoPlayer(player1);
        attaquePlayerVersBot(player1, bot);
        infoBot(bot);
      // Afficher les informations du Bot
    }

    /*
    NB: à chaque attaque du bot on ne demande pas d'appuiyer sur entrer
    donc si la variable choix tombe successivement sur 1 le bot attaquera en premier le player plusieurs fois
    sans qu'on demande d'appuiyer sur enter, ce n'est que lorsque la variable choix tomberas sur 0 qu'on demandera au player d'appuiyer sur entrer 
    */

    print('Fin du tour $i');
    i++;

    if (player1.health <= 0 || bot.health <= 0) {
      run = false;
    }
    /* Si l'un des deux ou les deux ont une santé <=0 ,le combat est terminé et
    c'est celui(entre le player et le bot) qui a la santé la plus élevé qui gagne
    */
  } while (run);

  if (player1.health > bot.health) {
    print('Vous avez gagné la partie!');
  } else if (player1.health < bot.health) {
    print('Vous avez perdu la partie!');
  } else {
    print('Match null');
  }
}

// Creation de la class Bot
class Bot {
  int force;
  int health;
  Bot(int force, int health) {
    this.force = force;
    this.health = health;
  }
}

class Player {
  String pseudo;
  int force;
  int health;
  Player(this.pseudo, this.force, this.health);
}

// Fonction InforPlayer qui va print les informations du Player

void infoPlayer(Player p) {
  print('${p.pseudo}  |  santé: ${p.health}  | force: ${p.force}');
}

void infoBot(Bot b) {
  print('bot | santé: ${b.health}  | force: ${b.force}');
}

void attaquePlayerVersBot(Player p, Bot b) {
  var coup = lanceDes(p.pseudo);
  print('${p.pseudo} assène un coup sur le bot avec une force de $coup');
  b.health -= coup;
}

void attaqueBotVersPlayer(Bot b, Player p) {
  var coup = lanceDes('bot');
  print('le bot assène un coup à ${p.pseudo} avec une force de $coup');
  p.health -= coup;
}

int lanceDes(String name) {
  final r1 = Random();

  var result = r1.nextInt(6) + 1 + r1.nextInt(6) + 1;

  print('$name a lancé les dés et a obtenu la valeur $result');
  return result;
}
