import '../Models/item.dart';
import '../Models/character.dart';
import 'dart:math';
import '../Player/items.dart';

class Chest extends Items {
  List<dynamic> item;
  bool isTrapped = false;

  Chest({required this.item});


  List<dynamic> openChest(Player player) {
    List<Weapon> weaponInChest = [];
    List<Secondary> secondaryInChest = [];
    List<Healing> healingInChest = [];
    List<dynamic> entireList = [];

    Random random = Random();
    int r1 = random.nextInt(2);
    int r2 = random.nextInt(10);
    int trapped = random.nextInt(1000);

    if (trapped <= 50) {
      isTrapped = true;
    }
    if (isTrapped == true) {
      print("It was a trapped chest!!\nYou take 6 damage!");
      player.currentPlayerHealth = player.currentPlayerHealth - 6;
      print("You have ${player.currentPlayerHealth} health left");
      print("This is your backpack: ${player.backpack}");
    }

    if (r1 == 1) {
      int randomSelect = random.nextInt(Items().weapons.length);
      int secondRandomSelect = random.nextInt(Items().secondaryItems.length);
      weaponInChest.add(Items().weapons[randomSelect]);
      secondaryInChest.add(Items().secondaryItems[secondRandomSelect]);
    }
    else if (r1 == 2) {
      int randomSelect = random.nextInt(Items().healingItems.length);
      int secondRandomSelect = random.nextInt(Items().secondaryItems.length);
      healingInChest.add(Items().healingItems[randomSelect]);
      secondaryInChest.add(Items().secondaryItems[secondRandomSelect]);
    }

    if (r2 >= 8) {
      print("You opened a chest!\nWOW it contained ${weaponInChest
          .toString()}, ${healingInChest.toString()}, and ${secondaryInChest
          .toString()}!!");
      addToBackpack(weaponInChest, player);
      addToBackpack(healingInChest, player);
      addToBackpack(secondaryInChest, player);
    }
    else {
      print("You opened a chest!\nIt contained ${weaponInChest.toString()} and a ${secondaryInChest.toString()}");
      addToBackpack(weaponInChest, player);
      addToBackpack(secondaryInChest, player);
    }
      item = entireList;
    return item;
  }
}
  void addToBackpack(List<Item> item, Player player) {
    player.backpack.addAll(item);
  }

  class EmptyChest extends Chest {
  EmptyChest({required super.item});
  }