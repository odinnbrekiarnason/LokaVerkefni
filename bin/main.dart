import 'dart:io';

import 'Functions.dart';



void main() {
  Player player = Player(playerName: "", position: RoomType.startingPoint);
  player = createPLayer(player);
  /*print("You are now in the game ${player.playerName}!");
  *//*print("You have ${player.playerMaxHealth} max health");
  print("You have ${player.currentPlayerHealth} health and ${player.playerDamage} damage");
  print("You have ${returnItemName(player.backpack)} in your backpack");
  print("You have a ${returnItemName(player.weaponInHand)} in your hand");
  print("You are at the starting point of the dungeon");*//*
  Chest chest = Chest(item: returnItemList());
  chest.openChest(player);*/
 roomCreation(RoomType.values, player);
 //String roomMap = currentRoomMap(player.position, player);

 beforeFirstInput(player.position);
 bool move = true;
 while(move == true) {
   String input = stdin.readLineSync().toString().toLowerCase();
   selection(player, player.position, input);
 }

// FloorOne().enterRoom(returnRooms);

 /*print("""
 +--------+--------+
 |   R1   >   R2   |
 |        |        |
 +---xx---+---vv---+
 |   R3   x   R4   |
 |        |        |
 +--------+--------+
 """);*/

}



