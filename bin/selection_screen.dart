import 'dart:io';
import 'Functions.dart';

void selection(Player player, Room room){
  print("You walk into the ${room.name}");
  print("You see a ${room.description}");
  print("Please type 1, 2 etc. to select option");
  print("1. Fight\n2. Backpack\n3. Check room chests\n4. Open door\n5. Check room map\n6. Check player stats\n7. Check room monsters\n9. Flee");
  print("Please select an option");

  String selectionInput = stdin.readLineSync().toString();

  switch(selectionInput) {
    case "1":
    if(room.isThereMonster == true) {
      print("You choose to fight!");
      attackMonster(player);
    } else {
      print("There is no monster to fight!");
    }
    case "2":
      print("You have opened your backpack");
      player.openBackPack();
    case "3":
      if(room.spawnChest() == true) {
        print("You found a chest!");
        room.openChest(player);
      } else {
        print("There is no chest in this room");
      }
    case "4":
      print("You try to open the door");
  
  }
}

