import 'dart:io';
import '../Functions.dart';

void selection(Player player, RoomType room) {
  print("You walk into the ${room.name}");
  print("You see a ${getRoomDescription(room)}");
  print("Please type 1, 2 etc. to select option");
  print("1. Fight\n2. Backpack\n3. Move player\n4. Check room map\n5. Check player stats\n6. Check room monsters\n7. Flee");
  print("Please select an option");

  String selectionInput = stdin.readLineSync().toString();
  RoomType pos = player.position;
  switch(selectionInput) {
    case "1":
      attackMonster(player, createMonster());

    case "2":
      print("You open your backpack");
      player.openBackPack();
    case "3":
      movePlayer(player, pos, currentRoomMap(pos, player));
    case "4":
      print("You try to open the door");
  
  }
}

