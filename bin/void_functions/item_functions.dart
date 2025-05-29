import '../Functions.dart';

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