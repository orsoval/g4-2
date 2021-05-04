import 'dart:io';
import 'dart:math';

import 'classe_bot.dart';
import 'classes_player.dart';

int lanceDee(String playerName) {
  final aleatoire = Random();
  final nombreAleatoire = aleatoire.nextInt(6) + 1 + aleatoire.nextInt(6) + 1;
  print('$playerName a lancé les dés et a obtenu la valeur $nombreAleatoire');
  return nombreAleatoire;
}

String lireText(String question) {
  print(question);
  return stdin.readLineSync();
}

//Une procédure (ou fonction) permettant d’afficher les infos essentielles d’un Player
void affichePlayer(Player p) {
  print('${p.pseudo} - Force : ${p.force} - Santé : ${p.sante}%');
}

//Une procédure (fonction) permettant d’afficher les infos essentielles d’un Bot
void afficheBot(Bot b) {
  print('Bot - Force : ${b.force} - Santé : ${b.sante}%');
}

//Une procédure (fonction) d’attaque du Player vers le Bot, qui reçoit les 2 objets en paramètres et lance l’attaque entre eux
void attaqueBot(Player player, Bot bot) {
  // Entree
  lireText('Appuyez sur entrée pour lancer les dés');
  final valeurDes = lanceDee(player.pseudo);
  bot.sante = bot.sante - valeurDes;
}

//Une procédure d’attaque du Bot vers le Player, qui reçoit les 2 objets en paramètres et lance l’attaque entre eux.
void attaquePlayer(Bot bot, Player player) {
  final valeurDes = lanceDee('Le bot');
  player.sante = player.sante - valeurDes;
}
