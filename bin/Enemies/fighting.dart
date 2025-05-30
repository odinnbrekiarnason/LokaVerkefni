import '../Functions.dart';
import 'dart:io';



void attackMonster(Player player, Monster selectedMonster) {
  bool flee = false;
  while(player.isDead == false && selectedMonster.checkIfDead(player) == false || flee == false) {
    
    print("\nWhat attack would you like to do?\n"
        "1.Normal attack\n2.Heavy attack\n3.Open backpack\n4.Flee\n5.Check player stats\n"
        "Note you have to type a number to select!"
    );
    bool check = false;

    String attackInput = stdin.readLineSync().toString();
    switch(attackInput) {
      case "1":
        if(selectedMonster.name == "Minotaur") {
          print("You attack the ${selectedMonster.name}");
          selectedMonster.health = selectedMonster.health - player.playerDamage;
          print("You did ${player.playerDamage} damage!");
          print("${selectedMonster.name} health: ${selectedMonster.health}");
        }
        else if(selectedMonster.name == "Goblin") {
          print("You attack the ${selectedMonster.name}");
          selectedMonster.health = selectedMonster.health - player.playerDamage;
          print("You did ${player.playerDamage} damage!");
          print("${selectedMonster.name} health: ${selectedMonster.health}");
        }
        else if(selectedMonster.name == "Wolf") {
          print("You attack the ${selectedMonster.name}");
          selectedMonster.health = selectedMonster.health - player.playerDamage;
          print("You did ${player.playerDamage} damage!");
          print("${selectedMonster.name} health: ${selectedMonster.health}");
        }

      case "2":
        if(selectedMonster.name == "Minotaur") {
          print("You charge the ${selectedMonster.name} with rage in your eyes!");
          selectedMonster.health = selectedMonster.health - player.playerDamage + 5;
          print("You did ${player.playerDamage + 5} damage!");
          print("${selectedMonster.name} health: ${selectedMonster.health}");
        }
        else if(selectedMonster.name == "Goblin") {
          print("You charge the ${selectedMonster.name} with rage in your eyes!");
          selectedMonster.health = selectedMonster.health - player.playerDamage + 5;
          print("You did ${player.playerDamage + 5} damage!");
          print("${selectedMonster.name} health: ${selectedMonster.health}");
        }
        else if(selectedMonster.name == "Wolf") {
          print("You charge the ${selectedMonster.name} with rage in your eyes!");
          selectedMonster.health = selectedMonster.health - player.playerDamage + 5;
          print("You did ${player.playerDamage + 5} damage!");
          print("${selectedMonster.name} health: ${selectedMonster.health}");
        }
      case "3":
        while(check == false) {
          openBackPack(player);
          check = true;
        }
        continue;
      case "4":
        print("You chose to flee");
        flee = true;
        break;
      case "5":
        while(check == false) {
          getPlayerInfo(player);
          check = true;
        }
    }
    if(flee == false) {
      selectedMonster.attackPlayer(player);
    }
    if(player.gameOver() == true) {
      break;
    }
    if(selectedMonster.checkIfDead(player) == true) {
      break;
    } 
    if(flee == true) {
      break;
    }
  }
}








