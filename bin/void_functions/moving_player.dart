import '../Functions.dart';
import 'dart:io';

String movePlayer(Player player, RoomType type, String map) {
  print("Which direction would you like to move?\nPs. you move 2 spaces at a time");
  String tempList = "";
  String moving = stdin.readLineSync().toString().toLowerCase();

  switch(type) {
    case RoomType.startingPoint :
     map = moveSpaces(map, moving, returnRowLength(map), returnColLength(map), player);
      return  map;

    case  RoomType.armory:




      return armory;
    default : return tempList;
  }
}

String moveSpaces(String map, String direction, int rows, int columns, Player player) {

  List<RoomType> connectedRooms = roomConnect['connections'][player.position] ?? [];
  List<Direction> availableDirections = roomConnect['directions'][player.position] ?? [];

  List<String> mapRows = map.split("\n");

  player.colPos = getColPos(player, map);
  player.rowPos = getRowPos(player, map);

  int playerRow = getRowPos(player, map);
  int playerCol = getColPos(player, map);

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

  if(player.rowPos < 1 || player.rowPos >= rows - 1 || player.colPos < 1 || player.colPos >= columns - 1) {
    print("Cannot move: out of bounds!");
    return map;
  }

  String dest = mapRows[player.rowPos].length > player.colPos ? mapRows[player.rowPos][player.colPos] : " ";
  if (dest != "." && dest != " " && !["^", "v", "<", ">"].contains(dest)) {
    print("Cannot move: blocked by obstacle");
    return map;
  }

  else if(dest == "M") {
    print("You are about to move into a monster prepare yourself!!");
    selection(player, player.position);
  }

  if(mapRows[player.rowPos - 1][player.colPos - 1] == "<" || mapRows[player.rowPos + 1][player.colPos + 1] == "<") {
    print("Would you like to enter the next room?\nYes or no");
    String input = stdin.readLineSync().toString().toLowerCase();
    switch(input) {
      case "yes" || "ye" || "y" || "j" || "ja" :
        int indexedDirection = availableDirections.indexOf(Direction.left);
        RoomType nextRoom = connectedRooms[indexedDirection];
        if(getRoomId(nextRoom) == 0) {
          print("No key needed go right ahead!");
          player.position = nextRoom;
          break;
        }
         print("Checking for correct key...");
        for(int i = 0; i < player.keyItems.length; i++) {
          if(idCheck(getRoomId(nextRoom), player.keyItems[i].id) == true) {
            print("You can get to the next room!");
            player.position = nextRoom;
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

  map = mapRows.join("\n");
  print(map);
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




