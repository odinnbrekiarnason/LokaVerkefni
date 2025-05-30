import '../Functions/function_exporter.dart';

Chest spawnChest() {
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