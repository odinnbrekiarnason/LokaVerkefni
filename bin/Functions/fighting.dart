import '../Functions/function_exporter.dart';


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
          sleep(Duration(milliseconds: 520));
          print("You did ${player.playerDamage} damage!");
          print("${selectedMonster.name} health: ${selectedMonster.health}");
          break;
        }
        else if(selectedMonster.name == "Goblin") {
          print("You attack the ${selectedMonster.name}");
          selectedMonster.health = selectedMonster.health - player.playerDamage;
          sleep(Duration(milliseconds: 520));
          print("You did ${player.playerDamage} damage!");
          print("${selectedMonster.name} health: ${selectedMonster.health}");
          break;
        }
        else if(selectedMonster.name == "Wolf") {
          print("You attack the ${selectedMonster.name}");
          selectedMonster.health = selectedMonster.health - player.playerDamage;
          sleep(Duration(milliseconds: 520));
          print("You did ${player.playerDamage} damage!");
          print("${selectedMonster.name} health: ${selectedMonster.health}");
          break;
        }
        else if(selectedMonster.name == "Royal Spectre") {
          print("You attack the Spectre with your ${player.weaponInHand}");
          selectedMonster.health = selectedMonster.health - player.playerDamage;
          sleep(Duration(milliseconds: 520));
          print("You hit it for ${player.playerDamage} damage!");
          print("${selectedMonster.name} health: ${selectedMonster.health}");
          break;
        }

      case "2":
        if(selectedMonster.name == "Minotaur") {
          print("You charge the ${selectedMonster.name} with rage in your eyes!");
          selectedMonster.health = selectedMonster.health - player.playerDamage + 5;
          sleep(Duration(milliseconds: 520));
          print("You did ${player.playerDamage + 5} damage!");
          print("${selectedMonster.name} health: ${selectedMonster.health}");
          break;
        }
        else if(selectedMonster.name == "Goblin") {
          print("You charge the ${selectedMonster.name} with rage in your eyes!");
          selectedMonster.health = selectedMonster.health - player.playerDamage + 5;
          sleep(Duration(milliseconds: 520));
          print("You did ${player.playerDamage + 5} damage!");
          print("${selectedMonster.name} health: ${selectedMonster.health}");
          break;
        }
        else if(selectedMonster.name == "Wolf") {
          print("You charge the ${selectedMonster.name} with rage in your eyes!");
          selectedMonster.health = selectedMonster.health - player.playerDamage + 5;
          sleep(Duration(milliseconds: 520));
          print("You did ${player.playerDamage + 5} damage!");
          print("${selectedMonster.name} health: ${selectedMonster.health}");
          break;
        }
        else if(selectedMonster.name == "Royal Spectre") {
          print("You charge the Spectre with your ${player.weaponInHand} and your burning will to win!");
          selectedMonster.health = selectedMonster.health - player.playerDamage;
          sleep(Duration(milliseconds: 520));
          print("KWABHAMM, You hit the Spectre for ${player.playerDamage} damage!");
          print("${selectedMonster.name} health: ${selectedMonster.health}");
          break;
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
          continue;
        }
      default :
        print("Error: Invalid input");
        continue;
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








