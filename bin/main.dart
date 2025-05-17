import 'Functions.dart';



void main() {
  Player player = Player(playerName: "", position: "starterRoom");
  player = createPLayer(player);
 // player.getPlayerInfo(player);
  print("You are now in the game ${player.playerName}!");
  print("You have ${player.currentPlayerHealth} health and ${player.playerDamage} damage");
  print("You have ${player.backpack.toString()} items in your backpack");
  print("You have ${player.playerMaxHealth} max health");
  print("You have ${player.weaponInHand} in your hand");  
  //print("You are at the starting point of the dungeon");
  print("first");
var returnRooms = FloorOne().completeList;
 returnRooms = FloorOne().selectRandomRooms(returnRooms);
 print("bug");
 roomCreation(returnRooms, player);
 print(player.getPos(player));


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



