import '../Functions/function_exporter.dart';

String returnItemName(List<Item> item) {
  String placeHolder = "Error big";
  if(item.isNotEmpty) {
    for(int i = 0; i < item.length; i++) {
      placeHolder = item[i].name;
      print(placeHolder);
    }
  } else if(item.isEmpty) {
    return "Error";
  }
  return placeHolder;
}

List<Item> returnItemList() {
  List<Item> allItems = [];
  allItems.addAll(Items().weapons);
  allItems.addAll(Items().healingItems);
  allItems.addAll(Items().secondaryItems);
  allItems.addAll(Items().keys);
  return allItems;
}

void addToBackpack(List<Item> item, Player player) {
  player.backpack.addAll(item);
}

bool isHealing(Item item) {
  if(item is Healing) {
    return true;
  }
  else {
    return false;
  }
}

bool isWeapon(Item item) {
  if(item is Weapon) {
    return true;
  }
  else {
    return false;
  }
}

bool isSecondary(Item item) {
  if(item is Secondary) {
    return true;
  }
  else {
    return false;
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
  else if(item.name == "Healing Potion") {
    print("You drink the potion and heal for ${item.healing}");
    player.currentPlayerHealth = player.currentPlayerHealth + item.healing;
    if(player.currentPlayerHealth > player.playerMaxHealth){
      player.currentPlayerHealth = player.playerMaxHealth;
      print("You healed up to full health!");
    } else {
      print("Your current health: ${player.currentPlayerHealth}");
    }
  }
}

void switchMainWeapon(Player player, Weapon weapon) {
  print("Your current damage: ${player.playerDamage}");
  List<Weapon> heldWeapon = player.weaponInHand;
  player.playerDamage = player.playerDamage - heldWeapon[0].damage;
  player.weaponInHand.removeAt(0);
  player.weaponInHand.add(weapon);
  player.playerDamage = player.playerDamage + weapon.damage;
  print("Your damage after switching: ${player.playerDamage}");
  addToBackpack(heldWeapon, player);
}

void switchToBow(Player player, Bow bow) {
  print("Your current damage: ${player.playerDamage}");
  List<Weapon> heldWeapon = player.weaponInHand;
  player.playerDamage = player.playerDamage - heldWeapon[0].damage;
  player.weaponInHand.removeAt(0);
  player.weaponInHand.add(bow);
  player.playerDamage = player.playerDamage + bow.damage;
  print("Your damage after switching: ${player.playerDamage}");
  addToBackpack(heldWeapon, player);
}

void drinkMilk(Player player) {
  print("You chug your hearty milk!");
  if(player.debuffs == true) {
    print("${player.debuffNames[0]} is removed");
    player.debuffs = false;
  } else {
    print("Nothing changed");
  }
}

int getCoin() {
  Random random = Random();
  int coin = random.nextInt(20);
  return coin;
}
