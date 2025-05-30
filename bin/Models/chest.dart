import 'dart:io';

import '../Functions.dart';
import 'dart:math';

class Chest extends Items {
  List<Item> item;
  bool isTrapped = false;

  Chest({required this.item});

  List<Item> openChest(Player player) {
    List<Item> entireList = returnItemList();
    List<Item> itemInChest = [];

    var healingItems = entireList.map((healing)
      => healing is Healing ? healing : null).where((healing) => healing != null).toList();

    var weaponItems = entireList.map((weapon)
      => weapon is Weapon ? weapon : null).where((weapon) => weapon != null).toList();

    var secondaryItems = entireList.map((secondary)
        => secondary is Secondary ? secondary :null).where((secondary) => secondary != null).toList();

    List healingInChest = healingItems;
    List weaponInChest = weaponItems;
    List secondaryInChest = secondaryItems;

    Random random = Random();
    int r1 = random.nextInt(2);
    int r2 = random.nextInt(10);
    int trapped = random.nextInt(1000);

    if (trapped <= 50) {
      isTrapped = true;
    }
    if (isTrapped == true) {
      sleep(Duration(milliseconds: 120));
      print("You open the chest");
      print("It was a trapped chest!!\nYou take 6 damage!");
      player.currentPlayerHealth = player.currentPlayerHealth - 6;
      print("You have ${player.currentPlayerHealth} health left");
    }

    if (r1 <= 0) {
      int randomSelect = random.nextInt(weaponInChest.length);
      int secondRandomSelect = random.nextInt(secondaryInChest.length);

      itemInChest.add(weaponInChest[randomSelect]);
      itemInChest.add(secondaryInChest[secondRandomSelect]);
    }
    if (r1 >= 1) {
      int randomSelect = random.nextInt(healingInChest.length);
      int secondRandomSelect = random.nextInt(secondaryInChest.length);

      itemInChest.add(healingInChest[randomSelect]);
      itemInChest.add(secondaryInChest[secondRandomSelect]);
    }

    if (r2 >= 8) {
      sleep(Duration(milliseconds: 500));
      print("You opened a chest!\nWOW it contained :");
      returnItemName(itemInChest);
      addToBackpack(itemInChest, player);
      openBackPack(player);
    }
    else {
      sleep(Duration(milliseconds: 500));
      print("You opened a chest!\nIt contained :");
      returnItemName(itemInChest);
      sleep(Duration(milliseconds: 300));
      addToBackpack(itemInChest, player);
      sleep(Duration(milliseconds: 300));
      print("Items added to backPack");
      openBackPack(player);
    }
      item = itemInChest;
    return item;
  }
}

class EmptyChest extends Chest {
  EmptyChest({required super.item});
}