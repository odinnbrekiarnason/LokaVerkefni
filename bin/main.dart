import 'Functions.dart';



void main() {
  Player player = Player(playerName: "", position: RoomType.startingPoint);
  player = createPLayer(player);
  print("You are now in the game ${player.playerName}!");
  /*print("You have ${player.playerMaxHealth} max health");
  print("You have ${player.currentPlayerHealth} health and ${player.playerDamage} damage");
  print("You have ${returnItemName(player.backpack)} in your backpack");
  print("You have a ${returnItemName(player.weaponInHand)} in your hand");
  print("You are at the starting point of the dungeon");*/
  var f1 = FloorOne();
  var returnRooms = f1.selectRandomRooms(f1.completeList);
  print(returnRooms);
  Chest chest = Chest(item: returnItemList());
  chest.openChest(player);
 returnRooms = f1.selectRandomRooms(returnRooms);
 roomCreation(returnRooms, player);
 String roomMap = printRoomMap(player.position, player);
 print(roomMap);
 bool move = true;
 while(move == true) {
   movePlayer(player, getPos(player));
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



