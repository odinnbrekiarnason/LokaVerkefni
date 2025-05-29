import "dart:io";

import "../Functions.dart";

void useItemInBackPack(Player player) {
  print("Please select an item\nInput 1, 2 etc. to select item");
  List items = player.backpack;

  var healingItems = items.map((healing) => healing is Healing ? healing : null)
      .where((healing) => healing != null).toList();

  var weaponItems = items.map((weapon) => weapon is Weapon ? weapon : null)
      .where((weapon) => weapon != null).toList();

  var secondaryItems = items.map((secondary) =>
  secondary is Secondary ? secondary : null).where((secondary) => secondary != null).toList();

  List healing = healingItems;
  List weapon = weaponItems;
  List secondary = secondaryItems;

  for (Item item in player.backpack) {
    print("|${item.name}|");
  }

  String input = stdin.readLineSync().toString().toLowerCase();
  int parsed = 0;
  try {
    parsed = int.parse(input);
  } catch (e) {
    print("Error: incorrect index");
  }
  if(parsed > player.backpack.length) {
    print("invalid index");
  }
  if (isHealing(player.backpack[parsed - 1])) {
    try {
      heal(player, healing[0]);
    } catch(e) {
      print("Error: no item found");
    }
  }
  else if(isWeapon(player.backpack[parsed - 1])) {
    print("Would you like to equip this weapon?");
    String answer = stdin.readLineSync().toString().toLowerCase();
    switch(answer) {
      case "yes" || "ye" || "y" || "j" :
        switchMainWeapon(player, weapon[0]);
    }
  }
  else if(isSecondary(player.backpack[parsed - 1])) {
    print("Cannot do anything with this");
  }
}

void heal(Player player, Healing item) {
  if(item.name == "Bandage") {
    print("You use a bandage and heal for ${item.healing}");
    player.currentPlayerHealth = player.currentPlayerHealth + item.healing;
    if(player.currentPlayerHealth > player.playerMaxHealth){
      player.currentPlayerHealth = player.playerMaxHealth;
      print("You healed up to full health!");
    } else {
      print("Your current health: ${player.currentPlayerHealth}");
    }
  }
}

void switchMainWeapon(Player player, List<Weapon> weapon) {
  List<Weapon> heldWeapon = player.weaponInHand;
  player.weaponInHand = weapon;
  addToBackpack(heldWeapon, player);
}