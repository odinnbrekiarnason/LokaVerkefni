import 'Functions.dart';



void main() {
  Player player = createPLayer();
  print("You are now in the game ${player.playerName}!");
  print("You have ${player.currentPlayerHealth} health and ${player.playerDamage} damage");
  print("You have ${player.backpack} items in your backpack");
  print("You have ${player.playerMaxHealth} max health");
  print("You have ${player.weaponInHand} in your hand");  
  print("You are at the starting point of the dungeon");
  Room room = Room(description: "Starting point", name: "Starting point", isThereMonster: false, type: RoomType.startingPoint, door: Door(key: player.backpack.Key, onOpen: () {}, direction: Direction.left)); 


//var returnRooms = FloorOne().completeList;
 //FloorOne().selectRandomRooms(returnRooms);
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



