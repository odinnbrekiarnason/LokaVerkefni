import '../Models/item.dart';
import '../Models/character.dart';
import 'dart:math';
import '../Player/item_list.dart';

class Chest extends Items {
  List<dynamic> item;
  bool isTrapped = false;

  Chest({required this.item});


  List<dynamic> openChest(Player player) {
    List<dynamic> entireList = returnItemList();
    List<dynamic> itemInChest = [];

    var healingItems = entireList.map((healing) {
      return healing is Healing ? healing : null;
    }).where((healing) => healing != null);

    var weaponItems = entireList.map((weapon) {
      return weapon is Weapon ? weapon : null;
    }).where((weapon) => weapon != null);

    var secondaryItems = entireList.map((secondary) {
      return secondary is Secondary ? secondary : null;
    }).where((secondary) => secondary != null);

    List/*<Weapon>*/ weaponInChest = weaponItems.toList();
    List/*<Secondary>*/ secondaryInChest = secondaryItems.toList();
    List/*<Healing>*/ healingInChest = healingItems.toList();

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
      int randomSelect = random.nextInt(weaponInChest.length);
      int secondRandomSelect = random.nextInt(secondaryInChest.length);
      itemInChest.add(weaponInChest[randomSelect]);
      itemInChest.add(secondaryInChest[secondRandomSelect]);
    }
    else if (r1 == 2) {
      int randomSelect = random.nextInt(healingInChest.length);
      int secondRandomSelect = random.nextInt(secondaryInChest.length);
      itemInChest.add(healingInChest[randomSelect]);
      itemInChest.add(secondaryInChest[secondRandomSelect]);
    }

    if (r2 >= 8) {
      print("You opened a chest!\nWOW it contained $weaponInChest, $healingInChest, and $secondaryInChest!!");
      addToBackpack(weaponInChest, player);
      addToBackpack(healingInChest, player);
      addToBackpack(secondaryInChest, player);
      player.openBackPack();

    }
    else {
      print("You opened a chest!\nIt contained $weaponInChest and a $secondaryInChest");
      addToBackpack(weaponInChest, player);
      addToBackpack(secondaryInChest, player);
      player.openBackPack();
    }
      item = itemInChest;
    return item;
  }
}
  void addToBackpack(List<dynamic> item, Player player) {
    player.backpack.addAll(item);
  }

  class EmptyChest extends Chest {
  EmptyChest({required super.item});
  }