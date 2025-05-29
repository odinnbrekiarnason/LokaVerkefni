/*
import '../Dungeon/whole_map.dart'; // For currentRoomMap, RoomType
import '../Functions.dart'; // For Player, Direction, Key
import 'dart:io'; // For stdin/stdout

bool moveToRoomByDirection(Player player, String map, Direction direction, List<Key> playerInventory) {
  // Check if player is at a door (based on map symbols)
  if (!map.contains('>') && !map.contains('<')) {
    print("You need to reach a door to move to another room.");
    return false;
  }

  // Get connections and directions for the current room
  List<RoomType> connectedRooms = roomConnect['connections'][player.currentRoom] ?? [];
  List<Direction> availableDirections = roomConnect['directions'][player.currentRoom] ?? [];

  if (connectedRooms.isEmpty || availableDirections.isEmpty) {
    print("No exits available from this room.");
    return false;
  }

  // Find the index of the desired direction
  int directionIndex = availableDirections.indexOf(direction);
  if (directionIndex == -1) {
    print("No exit in that direction.");
    return false;
  }

  // Get the target room
  RoomType newRoom = connectedRooms[directionIndex];

  // Check for key requirement (e.g., throneRoom needs BossRoomKey)
  if (newRoom == RoomType.throneRoom && !playerInventory.any((key) => key.id == 11)) {
    print("You need the BossRoomKey to enter the Throne Room.");
    return false;
  }

  // Update room history and current room
  player.roomHistory = [...player.roomHistory, player.currentRoom];
  player.currentRoom = newRoom;

  // Display the new room's map
  print(currentRoomMap(newRoom, player));
  return true;
}

// In bin/main.dart
import 'Functions.dart'; // Includes Player, movePlayer, moveToRoomByDirection, currentRoomMap
import 'dart:io';

void aiMain() {
  Player player = Player(
    position: RoomType.startingPoint,
    roomHistory: [],
  );
  List<Key> playerInventory = [
    // Initialize with some keys for testing
    Key(name: "Key", description: "A key to open a door", id: 1),
    Key(name: "BossRoomKey", description: "A key to open a door to the boss room", id: 11),
  ];
  String currentMap = currentRoomMap(player.position, player);
  print(currentMap);

  while (true) {
    print("Enter movement (w/a/s/d) or direction at door (up/down/left/right): ");
    String? input = stdin.readLineSync()?.toLowerCase();

    // Handle intra-room movement
    if (['w', 'a', 's', 'd'].contains(input)) {
      currentMap = movePlayer(currentMap, input, player);
      print(currentMap);
    }
    // Handle room transition
    else if (['up', 'down', 'left', 'right'].contains(input)) {
      Direction direction = Direction.values.firstWhere((d) => d.toString().split('.').last == input, orElse: () => Direction.up, // Default; adjust as needed
      );
      if (moveToRoomByDirection(player, currentMap, direction, playerInventory)) {
        currentMap = currentRoomMap(player.position, player);
        print(currentMap);
      }
    }
    // Optional: Go back to previous room
    else if (input == 'b') {
      if (player.roomHistory.isNotEmpty) {
        player.currentRoom = player.roomHistory.last;
        player.roomHistory = player.roomHistory.sublist(0, player.roomHistory.length - 1);
        currentMap = currentRoomMap(player.currentRoom, player);
        print(currentMap);
      } else {
        print("No previous room to return to.");
      }
    }
  }
}
*/
