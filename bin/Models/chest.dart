import '../Models/item.dart';
import '../Models/character.dart';
import 'dart:math';
import '../Player/items.dart';

class Chest extends Items {
  Item item;
  bool isTrapped = false;

  Chest({required this.item});


  void openChest(Player player) {
    Random random = new Random();
    int r1 = random.nextInt(2);
    int r2 = random.nextInt(10);
    int trapped = random.nextInt(1000);
    Healing healingInChest = Items().healingItems[0];
    Weapon weaponInChest = Items().weapons[0];
    Secondary secondaryInChest = Items().secondaryItems[0];

    if(trapped <= 50) {
      isTrapped = true;
    }
    if(isTrapped == true) {
      print("It was a trapped chest!!\nYou take 6 damage!");
      player.currentPlayerHealth = player.currentPlayerHealth - 6;
      return;
    }

    if(r1 == 1) {
      int randomSelect = random.nextInt(Items().weapons.length);
      int secondRandomSelect = random.nextInt(Items().secondaryItems.length);
      weaponInChest = Items().weapons[randomSelect];
      secondaryInChest = Items().secondaryItems[secondRandomSelect];
    }
    else if(r1 == 2) {
      int randomSelect = random.nextInt(Items().healingItems.length);
      int secondRandomSelect = random.nextInt(Items().secondaryItems.length);
      healingInChest = Items().healingItems[randomSelect];
      secondaryInChest = Items().secondaryItems[secondRandomSelect];
    }

    if(r2 >= 8) {
      print("You opened a chest!\nWOW it contained ${weaponInChest.name}, $healingInChest, and $secondaryInChest!!");
      addToBackpack(weaponInChest, player);
      addToBackpack(healingInChest, player);
      addToBackpack(secondaryInChest, player);
    }
    else {
      print("You opened a chest!\nIt contained $weaponInChest and a $secondaryInChest");
      addToBackpack(weaponInChest, player);
      addToBackpack(secondaryInChest, player);
    }
  }
  void addToBackpack(Item item, Player player) {
    player.backpack.add(item);
  }
}