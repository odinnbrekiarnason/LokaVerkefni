import "../Functions.dart";
import "dart:math";

Chest spawnChest() {
  List<dynamic> tempList = [];
  Random random = Random();
  bool chestOrNot = random.nextDouble() < 0.2;
  Chest chest = Chest(item: returnItemList());
  if(chestOrNot == true) {
    chest = Chest(item: returnItemList());
  }
  return chest;
}

Chest spawnEmptyChest() {
  return EmptyChest(item: Items().noItem);
}