import '../Functions/function_exporter.dart';

void useItemInBackPack(Player player) {
  print("Please select an item\nType 1, 2 etc. to select item");
  List<Item> items = player.backpack;

  var healingItems = items.map((healing) => healing is Healing ? healing : null)
      .where((healing) => healing != null).toList();

  var weaponItems = items.map((weapon) => weapon is Weapon ? weapon : null)
      .where((weapon) => weapon != null).toList();

  var bow = items.map((bow) => bow is Bow ? bow : null)
      .where((bow) => bow != null).toList();

  List bowWeapon = bow;
  List healing = healingItems;
  List weapon = weaponItems;

  for (Item item in player.backpack) {
    print("|${item.name}|");
  }

  String input = stdin.readLineSync().toString().toLowerCase();
  int parsed = 0;

  try {
    parsed = int.parse(input);
  } catch (e) {
    print("Error: invalid input\n");
  }

  if (parsed > player.backpack.length || parsed <= 0) {
    print("Error: incorrect index\n");
  }

  if (parsed != 0) {
    print("Would you like to drop this item : ${player.backpack[parsed - 1].name}\nYes/No");
    print("PS. Dropped items cannot be picked back up!");
    String answer = stdin.readLineSync().toString().toLowerCase();
    switch (answer) {
      case "yes" || "ye" || "y" || "j" || "ja" :
        String itemSelected = player.backpack[parsed - 1].name;
        print("Removing item...");
        player.backpack.removeAt(parsed - 1);
        print("Removed $itemSelected");
        break;
      default :
        print("Chose not to remove\n");
    }
  }

  if (isHealing(player.backpack[parsed - 1]) == true) {
    String healingName = player.backpack[parsed - 1].name;
    print("You chose : $healingName");
    for (int i = 0; i < healing.length; i++) {
      if (healingName == healing[i].name) {
        heal(player, healing[i]);
        player.backpack.removeAt(parsed - 1);
        break;
      } else {
        print("Error: no item found\n");
      }
    }
  }
  else if(isWeapon(player.backpack[parsed - 1]) == true) {
    print("Would you like to equip this weapon?\nYes/no");
    String answer = stdin.readLineSync().toString().toLowerCase();
    String weaponName = player.backpack[parsed - 1].name;
    switch(answer) {
      case "yes" || "ye" || "y" || "j" :
        for(int i = 0; i < weapon.length; i++) {
          if(weaponName == "Bow") {
            print("Switching weapons...");
            sleep(Duration(milliseconds: 600));
            switchToBow(player, bowWeapon[0]);
            print("Weapon switched to ${bowWeapon[0].name}");
            break;
          }
          else if(weaponName == weapon[i].name && weaponName != "Bow") {
            print("Switching weapons...");
            sleep(Duration(milliseconds: 600));
            switchMainWeapon(player, weapon[i]);
            print("Weapon switched to ${weapon[i].name}");
            break;
          } else {
            print("Error: No weapon found\n");
            break;
          }
        }
      default :
        print("Chose not to switch\n");
        break;
    }
  }
  else if(isSecondary(player.backpack[parsed - 1]) == true) {
    if(player.backpack[parsed - 1].name == "Milk") {
      print("Would you like to use or drop this item?");
      bool b = true;
      while(b == true) {
        print("Please type - drop or use");
        String answer = stdin.readLineSync().toString().toLowerCase();
        switch(answer) {
          case "drop" || "dro" || "dr":
            print("Dropping ${player.backpack[parsed - 1].name}");
            player.backpack.removeAt(parsed - 1);
            print("${player.backpack[parsed - 1].name} dropped!");
            b == false;
            break;
          case "use" || "us" || "u":
            drinkMilk(player);
            player.backpack.removeAt(parsed - 1);
            b == false;
            break;
          default :
            print("Please type drop/use");
            continue;
        }
      }
    }
    print("Would you like to drop this item?");
    String answer = stdin.readLineSync().toString().toLowerCase();
    switch(answer) {
      case "yes" || "ye" || "y" || "j" :
        player.backpack.removeAt(parsed - 1);
        break;
      default :
        print("Chose not to drop item\n");
        break;
    }
  }
}

