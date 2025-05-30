import '../Functions/function_exporter.dart';

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
    print("PS. you don't need to type in the direction exactly");
    print("If there is an error then to bad so sad cant really help :|...\n");
    sleep(Duration(milliseconds: 890));
    print("unless im there");
    print(" ");
  }
  else if(direction.contains("stop")) {
    print("You have stopped what would you like to do?");
    print("1. Backpack\n2. Move player\n3. Check player info\nPlease type 1, 2 or 3 to select option");
    String input = stdin.readLineSync().toString().toLowerCase();
    selection(player, player.position, input);
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

  //                           vvvvv Moves Player vvvvv
  //                            PS. Mostly done by AI
  String helpDirection = direction;
  if(helpDirection.contains(".")) {
    List help = direction.split(".");
    help.remove(".");
    int spaces = 0;
    try {
      spaces = int.parse(help[1]);
    } catch(e) {
      print("Error: incorrect number");
    }
    if(spaces > 6) {
      print("Cannot move more than 6 spaces!");
    } else {
      switch(help[0]) {
        case "up" || "u":
          player.rowPos -= spaces;
          break;
        case "down" || "dow" || "do" || "d":
          player.rowPos += spaces;
          break;
        case "left" || "lef" || "le" || "l":
          player.colPos -= spaces;
          break;
        case "right" || "righ" || "rig" || "ri" || "r":
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
  //                                Checks for map boundaries

  if(player.rowPos < 1 || player.rowPos >= rows - 1 || player.colPos < 1 || player.colPos >= columns - 1) {
    print("Cannot move: out of bounds!");
    return map;
  }

  String dest = mapRows[player.rowPos].length > player.colPos ? mapRows[player.rowPos][player.colPos] : " ";
  if (dest != " " && !["^", "v", "<", ">", "M", "C", "K", "B"].contains(dest) || ["|", "-"].contains(dest)) {
    print("Cannot move: blocked by obstacle");
    return map;
  }
  //                Checks for player position on the map and does various things with that info

  if(checkForIndex("M", player, map) == true) {
    print("You are about to fight a monster prepare yourself!!\n");
    attackMonster(player, createMonster());
    hasFoughtMonster = true;
  }
  else if(checkForIndex("B", player, map) == true && player.position == RoomType.bossRoom) {
    print("You are about to fight the boss of this dungeon!");
    print("Are you sure you are ready?");
    print("Yes/No");
    String input = stdin.readLineSync().toString().toLowerCase();
    switch(input) {
      case "yes" || "ye" || "y" :
        print("If you say you are ready then go ahead");
        attackMonster(player, createBoss());
      case "no" || "na" || "n" :
        print("Then you need to get stronger!");
        break;
    }
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
    for(int i = 0; i < keyIndex.length; i++) {
      pickedUpKeys.add(Key(name: "Key", description: "A shiny key", id: keyIndex[i]));
    }
    if(pickedUpKeys.contains(Key(name: "BossRoomKey", description: "A key to open a door to the boss room", id: 11))) {
      print("Looks like you picked up the Boss Key\nYou can now enter the Bosses room");
    } else {
      print("Added keys to your key inventory");
      player.keyItems.addAll(pickedUpKeys);
      print(player.keyItems);
    }
    hasPickedUpKey = true;
  }

  //                                Check for correct key in inventory
  //                                   And moves player to next room

  if(checkForIndex("<", player, map) == true || ["<"].contains(dest)) {
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
         print("You go through your keychain...");
         sleep(Duration(seconds: 1));
         for(Key key in player.keyItems) {
          if(getRoomId(nextRoom) == key.id) {
            print("You can get to the next room!");
            player.position = nextRoom;
            print("You enter ${nextRoom.name}");
            break;
          } else {
            print("Not this one");
            sleep(Duration(seconds: 1));
          }
        }
      }
      default :
        print("invalid input chose to stay");
    }
  }

  if(checkForIndex(">", player, map) == true || [">"].contains(dest)) {
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
        print("You go through your keychain...");
        sleep(Duration(seconds: 1));
        for(Key key in player.keyItems) {
          if(getRoomId(nextRoom) == key.id) {
            print("You can get to the next room!");
            player.position = nextRoom;
            print("You enter ${nextRoom.name}");
            break;
          } else {
            print("Not this one");
            sleep(Duration(seconds: 1));
          }
        }
      default :
        print("invalid input chose to stay");
    }
  }

  if(checkForIndex("V", player, map) == true || ["V"].contains(dest)) {
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
        print("You go through your keychain...");
        sleep(Duration(seconds: 1));
        for(Key key in player.keyItems) {
          if(getRoomId(nextRoom) == key.id) {
            print("You can get to the next room!");
            player.position = nextRoom;
            print("You enter ${nextRoom.name}");
            break;
          } else {
            print("Not this one");
            sleep(Duration(seconds: 1));
          }
        }
      default :
        print("invalid input chose to stay");
    }
  }
  
  if(checkForIndex("^", player, map) == true || ["^"].contains(dest)) {
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
        print("You go through your keychain...");
        sleep(Duration(seconds: 1));
        for(Key key in player.keyItems) {

          if(getRoomId(nextRoom) == key.id) {
            print("You can get to the next room!");
            player.position = nextRoom;
            print("You enter ${nextRoom.name}");
            break;
          } else {
            print("Not this one");
            sleep(Duration(seconds: 1));
          }
        }
      default :
        print("invalid input chose to stay");
    }
  }

  //                                   Mostly done by AI/Grok
  //      This replaces the P object in string with a space and places the P on the desired spot

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
//                     Replaces objects with P or space depending on character position
      if(mapRows[getRowPosItem("C", map)].contains("P")) {
        newRowString.write(c == getColPosItem("C", map) ? " " : mapRows[getRowPosItem("C", map)][c]);
      } else {
        newRowString.write(c == getColPosItem("C", map) ? "P" : mapRows[getRowPosItem("C", map)][c]);
      }
    }
    mapRows[getRowPosItem("C", map)] = newRowString.toString();
  }

  if(hasFoughtMonster == true) {
    newRowString = StringBuffer();
    for (int c = 0; c < mapRows[getRowPosItem("M", map)].length; c++) {
      if(mapRows[getRowPosItem("M", map)].contains("P")) {
//                         -----------------------||-----------------------
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
//                         -----------------------||-----------------------
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
// Returns Map dimensions
int returnColLength(String map) {
  var splitMap = map.split("\n");
  return splitMap[0].length;
}

int returnRowLength(String map) {
  var splitMap = map.split("\n");
  return splitMap.length;
}




