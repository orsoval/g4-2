import 'dart:math';
import 'package:robots/classe_bot.dart';
import 'package:robots/classes_player.dart';
import 'package:robots/utils.dart';

void main(List<String> arguments) {
  // 1 - creation de l'Objet Bot avec force 100 et sante 1
  final bot = Bot(force: 1, sante: 100);

  //Créez un objet Player qui représentera le joueur en cours
  final player = Player(force: 1, sante: 100);

  // lireText est une fonction qui peremet de recuperer le speudo
  final username = lireText('Entrez votre pseudo :');

  player.pseudo = username;

  //  compteur : Me donne la possibiliter le compter le nombre de tour
  var compteur = 0;

  print('Un bot se présente à vous et veut se battre...\n');

  //************
  //  LE Do WHILE
  // Permet d'excecuter le code plusieur fois jusqu'a ce que la condition du while soit juste
  // Il excecute une fois le do avant de verifier la condition
  //
  // Nous pouvons aussi utiliser le While qui fais la meme chose sauf qu'elle verifie
  // La condition avant de repeter l'action a l'interieur de celle ci
  /// */

  ///*** EXEMPLE  */
  // while(bot.sante > 0){
  //   // Intruction a excecuter
  //   // Intruction a excecuter
  //   // Intruction a excecuter
  // }

  do {
    // Lancer de Dee aleatoire
    var tour = Random().nextBool();
    if (tour) {
      attaqueBot(player, bot);
    } else {
      attaquePlayer(bot, player);
    }

    //Afficher les infos bot et player
    affichePlayer(player);
    afficheBot(bot);

    compteur++;
    print('Fin du tour $compteur\n');
  } while (bot.sante > 0 && player.sante > 0);
  if (bot.sante < 0 && player.sante > 0) {
    print('Le bot est vaincu!');
  } else if (player.sante < 0 && bot.sante > 0) {
    print('Vous avez perdu la partie!');
  }
}
