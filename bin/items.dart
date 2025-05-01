import 'dart:io';
import 'dart:math';
import 'character.dart';

class Items{
  List weapons = [
    "Shortsword",
    "Longsword",
    "Bow",
    "Axe",
    "Dagger",
  ];
  List secondaryItems = [
    "Healing Potion",
    "Stamina Potion",
    "Arrows",
    "Bandage",
  ];
  List backpack = [
    "Health potion",
    "Bandage"
  ];

  void openBackPack(){
    print("Your backpack contains:");
    for(String item in backpack){
      print(item);
    }
  }
}

class Chest extends Items{
  bool isTrapped = false;


  void openChest(){
    Random random = new Random();
    int r1 = random.nextInt(2);
    int r2 = random.nextInt(10);
    int trapped = random.nextInt(1000);
    String weaponInChest = "";
    String potionInChest = "";

    if(trapped <= 50){
      isTrapped = true;
    }
    if(isTrapped == true){
      print("It was a trapped chest!!\nYou take 6 damage!");
      Player().playerHealth = Player().playerHealth - 6;
      return;
    }

    if(r1 == 1){
      int randomSelect = random.nextInt(weapons.length);
      weaponInChest = weapons[randomSelect];
    }
    else if(r1 == 2){
      int randomSelect = random.nextInt(secondaryItems.length);
      potionInChest = secondaryItems[randomSelect];
    }
    if(r2 >= 7){
      print("You opened a chest!\nWOW it contained $weaponInChest and $potionInChest!!");
      addToBackpack(weaponInChest);
      addToBackpack(potionInChest);
    }
    else{
    print("You opened a chest!\nIt contained $weaponInChest");
    addToBackpack(weaponInChest);
    }
  }
  void addToBackpack(item) {
    backpack.add(item);
  }


}

