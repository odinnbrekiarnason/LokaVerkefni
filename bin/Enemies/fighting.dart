import '../Functions.dart';
import 'dart:io';



void attackMonster(Player player, Monster selectedMonster) {
  String attackInput = stdin.readLineSync().toString();
  print(
    "What attack would you like to do?\n"
    "1.Normal attack\n2.Heavy attack\n3.Open backpack"
    "Note you have to type a number to select attack!");
  while(player.isDead == false && selectedMonster.checkIfDead() == false) {
    switch(attackInput) {
      case "1":
        if(selectedMonster.name == "Minotaur") {
          print("You attack the ${selectedMonster.name}");
          selectedMonster.health = player.playerDamage - selectedMonster.health;
          print("You did ${player.playerDamage} damage!");
        }
        else if(selectedMonster.name == "Goblin") {
          print("You attack the ${selectedMonster.name}");
          selectedMonster.health = player.playerDamage - selectedMonster.health;
          print("You did ${player.playerDamage} damage!");
        }
        else if(selectedMonster.name == "Wolf") {
          print("You attack the ${selectedMonster.name}");
          selectedMonster.health = player.playerDamage - selectedMonster.health;
          print("You did ${player.playerDamage} damage!");
        }

      case "2":
        if(selectedMonster.name == "Minotaur") {
          print("You charge the ${selectedMonster.name} with rage in your eyes!");
          selectedMonster.health = player.playerDamage + 5 - selectedMonster.health ;
          print("You did ${player.playerDamage + 5} damage!");
        }
        else if(selectedMonster.name == "Goblin") {
          print("You charge the ${selectedMonster.name} with rage in your eyes!");
          selectedMonster.health = player.playerDamage + 5 - selectedMonster.health ;
          print("You did ${player.playerDamage + 5} damage!");
        }
        else if(selectedMonster.name == "Wolf") {
          print("You charge the ${selectedMonster.name} with rage in your eyes!");
          selectedMonster.health = player.playerDamage + 5 - selectedMonster.health ;
          print("You did ${player.playerDamage + 5} damage!");
        }
      case "3":
        player.openBackPack();
    }
    selectedMonster.attackPlayer(player);

    if(player.gameOver() == true) {
      break;
    }
    if(selectedMonster.checkIfDead() == true) {
      break;
    }
  }


}








