import 'dart:math';
import '../Functions.dart';
import 'dart:io';

String movePlayer(Player player, RoomType type, String map) {
    print("Which direction would you like to move?\nPs. you move 2 spaces at a time");
    print(map);

  String input = stdin.readLineSync().toString().toLowerCase();

  switch(type) {
    case RoomType.startingPoint:
      startingPoint = moveSpaces(map, input, returnRowLength(map), returnColLength(map), player);
      return startingPoint;
    case RoomType.armory:
      armory = moveSpaces(map, input, returnRowLength(map), returnColLength(map), player);
      return armory;
    case RoomType.diningRoom:
      diningRoom = moveSpaces(map, input, returnRowLength(map), returnColLength(map), player);
      return diningRoom;
    case RoomType.emptyChamber:
      emptyChamber = moveSpaces(map, input, returnRowLength(map), returnColLength(map), player);
      return emptyChamber;
    case RoomType.kitchen:
      kitchen = moveSpaces(map, input, returnRowLength(map), returnColLength(map), player);
      return kitchen;
    case RoomType.library:
      library = moveSpaces(map, input, returnRowLength(map), returnColLength(map), player);
      return library;
    case RoomType.throneRoom:
      throneRoom = moveSpaces(map, input, returnRowLength(map), returnColLength(map), player);
      return throneRoom;
    case RoomType.bossRoom:
      bossRoom = moveSpaces(map, input, returnRowLength(map), returnColLength(map), player);
      return bossRoom;
    case RoomType.bedroom:
      bedroom = moveSpaces(map, input, returnRowLength(map), returnColLength(map), player);
      return bedroom;
    case RoomType.treasureChamber:
      treasureRoom = moveSpaces(map, input, returnRowLength(map), returnColLength(map), player);
      return treasureRoom;
    case RoomType.storageRoom:
      storageRoom = moveSpaces(map, input, returnRowLength(map), returnColLength(map), player);
      return storageRoom;
    case RoomType.hallway:
      hallway = moveSpaces(map, input, returnRowLength(map), returnColLength(map), player);
      return hallway;
  }
}

String moveSpaces(String map, String direction, int rows, int columns, Player player) {

  if(direction.contains("help")) {
    print("You have called for me");
    print("If you are stuck or cant get somewhere in a room\nType in 'up-down-left-right.1-5' that will move you up by your choice of spaces up to 5\nExample: 'up.1'\n");
    print("PS. you need to type in the direction exactly, not d.3 it needs to be down.3");
    print("If there is an error then to bad so sad cant really help :|");
  }

  List<RoomType> connectedRooms = roomConnect['connections'][player.position] ?? [];
  List<Direction> availableDirections = roomConnect['directions'][player.position] ?? [];

  List<String> mapRows = map.split("\n");

  bool hasOpenedChest = false;
  bool hasFoughtMonster = false;
  bool hasPickedUpKey = false;

  player.colPos = getColPos(player, map);
  player.rowPos = getRowPos(player, map);

  int playerRow = getRowPos(player, map);
  int playerCol = getColPos(player, map);

  String helpDirection = direction;
  if(helpDirection.contains(".")) {
    List help = direction.split(".");
    help.remove(".");
    int spaces = int.parse(help[1]);
    print(spaces);
    print(help[0]);
    try {
      spaces = int.parse(help[1]);
    } catch(e) {
      print("Error: incorrect number");
    }
    if(spaces > 5) {
      print("Cannot move more than 5 spaces!");
    } else {
      switch(help[0]) {
        case "up" :
          player.rowPos -= spaces;
          break;
        case "down" :
          player.rowPos += spaces;
          break;
        case "left" :
          player.colPos -= spaces;
          break;
        case "right" :
          player.colPos += spaces;
          break;
      }
    }
  } else {
    switch (direction) {
      case "up" || "upp" || "u":
        player.rowPos -= 2;
        break;
      case "down" || "dow" || "d":
        player.rowPos += 2;
        break;
      case "left" || "lef" || "l":
        player.colPos -= 2;
        break;
      case "right" || "rig" || "r":
        player.colPos += 2;
        break;
      default:
        print("Please input a valid direction\nup, down, left, right");
        return map;
    }
  }

  if(player.rowPos < 1 || player.rowPos >= rows - 1 || player.colPos < 1 || player.colPos >= columns - 1) {
    print("Cannot move: out of bounds!");
    return map;
  }

  String dest = mapRows[player.rowPos].length > player.colPos ? mapRows[player.rowPos][player.colPos] : " ";
  if (dest != " " && !["^", "v", "<", ">", "M", "C", "K"].contains(dest) || ["|", "-"].contains(dest)) {
    print("Cannot move: blocked by obstacle");
    return map;
  }

  if(checkForIndex("M", player, map) == true) {
    print("You are about to fight a monster prepare yourself!!\n");
    attackMonster(player, createMonster());
    hasFoughtMonster = true;
  }

  if(checkForIndex("C", player, map) == true) {
    print("You spot a chest!");
    Chest chest = Chest(item: returnItemList());
    chest.openChest(player);
    hasOpenedChest = true;
  }
  
  if(checkForIndex("K", player, map) == true) {
    print("You pickup a key!");
    List<int> keyIndex = [];
    List<Key> pickedUpKeys = [];
    for(RoomType type in connectedRooms) {
      keyIndex.add(getRoomId(type));
    }
    for(int i = 1; i < keyIndex.length; i++) {
      pickedUpKeys.add(Key(name: "Key", description: "A shiny key", id: keyIndex[i]));
    }
    if(pickedUpKeys.contains(Key(name: "BossRoomKey", description: "A key to open a door to the boss room", id: 11))) {
      print("Looks like you picked up the Boss Key\nYou can now enter the Bosses room");
    } else {
      print("Added keys to your key inventory");
      player.keyItems.addAll(pickedUpKeys);
    }
    hasPickedUpKey = true;
  }

  if(checkForIndex("<", player, map) == true) {
    print("Would you like to enter the next room?\nYes or no");
    String input = stdin.readLineSync().toString().toLowerCase();
    switch(input) {
      case "yes" || "ye" || "y" || "j" || "ja" :
        int indexedDirection = availableDirections.indexOf(Direction.left);
        RoomType nextRoom = connectedRooms[indexedDirection];
        if(getRoomId(nextRoom) == 0) {
          print("No key needed go right ahead!");
          player.position = nextRoom;
          print("You enter ${nextRoom.name}");
          break;
        } else {
         print("Checking for correct key...");
        for(Key key in player.keyItems) {
          if (idCheck(getRoomId(nextRoom), key.id) == true) {
            print("You can get to the next room!");
            player.position = nextRoom;
            print("You enter ${nextRoom.name}");
            break;
          } else {
            print("You don't have the correct key for this door!");
            break;
          }
        }
      }
      default :
        print("invalid input chose to stay");
    }
  }

  if(checkForIndex(">", player, map) == true) {
    print("Would you like to enter the next room?\nYes or no");
    String input = stdin.readLineSync().toString().toLowerCase();
    switch(input) {
      case "yes" || "ye" || "y" || "j" || "ja" :
        int indexedDirection = availableDirections.indexOf(Direction.right);
        RoomType nextRoom = connectedRooms[indexedDirection];
        if(getRoomId(nextRoom) == 0) {
          print("No key needed go right ahead!");
          player.position = nextRoom;
          print("You enter ${nextRoom.name}");
          break;
        }
        print("Checking for correct key...");
        for(Key key in player.keyItems) {
          if(idCheck(getRoomId(nextRoom), key.id) == true) {
            print("You can get to the next room!");
            player.position = nextRoom;
            print("You enter ${nextRoom.name}");
            break;
          } else {
            print("You don't have the correct key for this door!");
            break;
          }
        }
      default :
        print("invalid input chose to stay");
    }
  }

  if(checkForIndex("V", player, map) == true) {
    print("Would you like to enter the next room?\nYes or no");
    String input = stdin.readLineSync().toString().toLowerCase();
    switch(input) {
      case "yes" || "ye" || "y" || "j" || "ja" :
        int indexedDirection = availableDirections.indexOf(Direction.down);
        RoomType nextRoom = connectedRooms[indexedDirection];
        if(getRoomId(nextRoom) == 0) {
          print("No key needed go right ahead!");
          player.position = nextRoom;
          print("You enter ${nextRoom.name}");
          break;
        }
        print("Checking for correct key...");
        for(Key key in player.keyItems) {
          if(idCheck(getRoomId(nextRoom), key.id) == true) {
            print("You can get to the next room!");
            player.position = nextRoom;
            print("You enter ${nextRoom.name}");
            break;
          } else {
            print("You don't have the correct key for this door!");
            break;
          }
        }
      default :
        print("invalid input chose to stay");
    }
  }
  
  if(checkForIndex("^", player, map) == true) {
    print("Would you like to enter the next room?\nYes or no");
    String input = stdin.readLineSync().toString().toLowerCase();
    switch(input) {
      case "yes" || "ye" || "y" || "j" || "ja" :
        int indexedDirection = availableDirections.indexOf(Direction.up);
        RoomType nextRoom = connectedRooms[indexedDirection];
        if(getRoomId(nextRoom) == 0) {
          print("No key needed go right ahead!");
          player.position = nextRoom;
          print("You enter ${nextRoom.name}");
          break;
        }
        print("Checking for correct key...");
        for(Key key in player.keyItems) {
          if(idCheck(getRoomId(nextRoom), key.id) == true) {
            print("You can get to the next room!");
            player.position = nextRoom;
            print("You enter ${nextRoom.name}");
            break;
          } else {
            print("You don't have the correct key for this door!");
            break;
          }
        }
      default :
        print("invalid input chose to stay");
    }
  }


  StringBuffer newRowString = StringBuffer();
  for (int c = 0; c < mapRows[playerRow].length; c++) {
    newRowString.write(c == playerCol ? " " : mapRows[playerRow][c]);
  }
  mapRows[playerRow] = newRowString.toString();

  newRowString = StringBuffer();
  for (int c = 0; c < mapRows[player.rowPos].length; c++) {
    newRowString.write(c == player.colPos ? "P" : mapRows[player.rowPos][c]);
  }
  mapRows[player.rowPos] = newRowString.toString();

  if(hasOpenedChest == true) {
    newRowString = StringBuffer();
    for (int c = 0; c < mapRows[getRowPosItem("C", map)].length; c++) {
      if(mapRows[getRowPosItem("C", map)].contains("P")) {
        newRowString.write(c == getColPosItem("C", map) ? "P" : mapRows[getRowPosItem("C", map)][c]);
      } else {
        newRowString.write(c == getColPosItem("C", map) ? " " : mapRows[getRowPosItem("C", map)][c]);
      }
    }
    mapRows[getRowPosItem("C", map)] = newRowString.toString();
  }

  if(hasFoughtMonster == true) {
    newRowString = StringBuffer();
    for (int c = 0; c < mapRows[getRowPosItem("M", map)].length; c++) {
      if(mapRows[getRowPosItem("M", map)].contains("P")) {
        newRowString.write(c == getColPosItem("M", map) ? " " : mapRows[getRowPosItem("M", map)][c]);
      } else {
        newRowString.write(c == getColPosItem("M", map) ? "P" : mapRows[getRowPosItem("M", map)][c]);
      }
    }
    mapRows[getRowPosItem("M", map)] = newRowString.toString();
  }

  if(hasPickedUpKey == true) {
    newRowString = StringBuffer();
    for (int c = 0; c < mapRows[getRowPosItem("K", map)].length; c++) {
      if (mapRows[getRowPosItem("K", map)].contains("P")) {
        newRowString.write(c == getColPosItem("K", map) ? " " : mapRows[getRowPosItem("K", map)][c]);
      } else {
        newRowString.write(c == getColPosItem("K", map) ? "P" : mapRows[getRowPosItem("K", map)][c]);
      }
    }
      mapRows[getRowPosItem("K", map)] = newRowString.toString();
  }

  map = mapRows.join("\n");
  return map;
}

int returnColLength(String map) {
  var splitMap = map.split("\n");
  return splitMap[0].length;
}

int returnRowLength(String map) {
  var splitMap = map.split("\n");
  return splitMap.length;
}




