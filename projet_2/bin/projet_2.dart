import 'dart:math';
import 'dart:io';
import 'package:projet_2/class_bot.dart';
import 'package:projet_2/class_player.dart';

// Importations des class  dans le dossier /lib
void main(List<String> arguments) {
  var i = 1;
  var run = true;
  var bot = Bot(1, 100);

  // Creation de l'objet de type player
  var player1 = Player('', 1, 100);

  // Recuperer le pseudo demander dans l'objet player1
  print('Entrer votre pseudo : ');
  var pseudo = stdin.readLineSync();

  player1.pseudo = pseudo;

  do {
    final r = Random();
    var choix = r.nextInt(2);

    switch (choix) {
      case 0:
        print('${player1.pseudo} Attaque en premier');
        print('----$pseudo Appuyer sur ENTRER pour lancer les dés----');
        stdin.readLineSync();
        player1.attaquePlayerVersBot(bot);
        bot.infoBot();
        bot.attaqueBotVersPlayer(player1);
        player1.infoPlayer();
        // Afficher les informations du player1
        break;
      default:
        print('Bot attaque en premier');
        bot.attaqueBotVersPlayer(player1);
        player1.infoPlayer();
        player1.attaquePlayerVersBot(bot);
        bot.infoBot();
      // Afficher les informations du Bot
    }

    print('Fin du tour $i');
    i++;

    if (player1.health <= 0 || bot.health <= 0) {
      run = false;
    }
  } while (run);

  if (player1.health > bot.health) {
    player1.victoire();
  } else if (player1.health < bot.health) {
    print('Vous avez perdu la partie!');
  } else {
    print('Match null');
  }
}
