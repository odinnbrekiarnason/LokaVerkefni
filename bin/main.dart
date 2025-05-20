import 'Functions.dart';



void main() {
  Player player = Player(playerName: "", position: RoomType.startingPoint);
  player = createPLayer(player);
 // player.getPlayerInfo(player);
  print("You are now in the game ${player.playerName}!");
  print("You have ${player.currentPlayerHealth} health and ${player.playerDamage} damage");
  print("You have ${player.backpack} items in your backpack");
  print("You have ${player.playerMaxHealth} max health");
  print("You have ${player.weaponInHand} in your hand");  
  //print("You are at the starting point of the dungeon");
  var f1 = FloorOne();
  var returnRooms = f1.selectRandomRooms(f1.completeList);
  print(returnRooms);
 //returnRooms = f1.selectRandomRooms(returnRooms);
 roomCreation(returnRooms, player);
 print(printRoomMap(player.position, player));
 //print(player.getPos(player));


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



