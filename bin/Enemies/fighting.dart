import '../Functions.dart';
import 'dart:io';
import 'dart:math';

  String selectedMonster = selectMonster();
  String attackInput = stdin.readLineSync().toString();

void attack() {
  Player player = Player();
  print(
    "What attack would you like to do?\n"
    "1.Normal attack\n2.Heavy attack\n"
    "Note you have to type a number to select attack!");

  switch(attackInput) {
    case "1":
      if(selectedMonster == "Minotaur"){
      print("You attack the $selectedMonster");
      Minotaur().health = player.playerDamage - Minotaur().health ;
        print("You did ${player.playerDamage} damage!");
      }
      else if(selectedMonster == "Goblin"){
        print("You attack the $selectedMonster");
        Goblin().health = player.playerDamage - Goblin().health;
        print("You did ${player.playerDamage} damage!");
      }
      else if(selectedMonster == "Wolf"){
        print("You attack the $selectedMonster");
        Wolf().health = player.playerDamage - Wolf().health ;
        print("You did ${player.playerDamage} damage!");
      }

    case "2":
      if(selectedMonster.contains("Minotaur")){
        print("You charge the $selectedMonster with rage in your eyes!");
        Minotaur().health = player.playerDamage + 5 - Minotaur().health ;
        print("You did ${player.playerDamage + 5} damage!");
      }
      else if(selectedMonster.contains("Goblin")){
        print("You charge the $selectedMonster with rage in your eyes!");
        Goblin().health = player.playerDamage + 5 - Goblin().health ;
        print("You did ${player.playerDamage + 5} damage!");
      }
      else if(selectedMonster.contains("Wolf")){
        print("You charge the $selectedMonster with rage in your eyes!");
        Wolf().health = player.playerDamage + 5 - Wolf().health ;
        print("You did ${player.playerDamage + 5} damage!");
      }
  }
}








