import '../Functions.dart';
import 'dart:io';

String movePlayer(Player player, RoomType type) {
  print("Which direction would you like to move?\nPs. you move 2 spaces at a time");
  String tempList = "";
  String moving = stdin.readLineSync().toString().toLowerCase();

  switch(type) {
    case RoomType.startingPoint :
      String startingRoomMap = """
+----------------↕↕↕----------------+
|                                   |
|                                   |
|                 P                 |
|                                   >
|                                   >
|                                   >
|                                   |
|                                   |
|                                   |
+-----------------------------------+
""";
      return moveSpaces(startingRoomMap, moving, returnRowLength(startingRoomMap), returnColLength(startingRoomMap), player);

    case  RoomType.armory:
      print("Which direction would you like to move?\nPs. you move 2 spaces at a time");

      String armory = """
+----------------door---------------+
| Crate           p           Armor |
|                             Rack  |
|                 .                 |
| Weapon                            >
| Rack                          door>
|                                   >
|                                   |
|                                   |
| Barrel                      Crate |
+----------------door---------------+
      """;

     /* switch(moving) {
        case "down" || "dow" || "d" :
          String tempMap = armory;
          print("top");
          int index = findIndex(tempMap);
          tempMap[index] = tempMap.removeAt(index);
          print("mid");
          tempMap.insert(index, " ");
          print(tempMap);
          print("bottom");

      }*/

      return armory;
    default : return tempList;
  }
}

String moveSpaces(String map, String direction, int rows, int columns, Player player) {

  print(player.colPos);
  print(player.rowPos);

  List<String> mapRows = map.split("\n");

/*  int playerRow = getRowPos(player, map);
  int playerCol = getColPos(player, map);*/

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

  String dest = mapRows[newRow].length > newCol ? mapRows[newRow][newCol] : " ";
  if (dest != "." && dest != " " && !["^", "v", "<", ">"].contains(dest)) {
    print("Cannot move: blocked by obstacle");
    return map;
  }
  else if(dest == "M") {
    print("You are about to move into a monster prepare yourself!!");
    attackMonster(p);
  }
  else if(["^", "v", "<", ">"].contains(dest)) {
    print("You are about to walk into another room are you sure you want to do that?");
  }

  StringBuffer newRowString = StringBuffer();
  for (int c = 0; c < mapRows[playerRow].length; c++) {
    newRowString.write(c == playerCol ? " " : mapRows[playerRow][c]);
  }
  mapRows[playerRow] = newRowString.toString();

  newRowString = StringBuffer();
  for (int c = 0; c < mapRows[newRow].length; c++) {
    newRowString.write(c == newCol ? "P" : mapRows[newRow][c]);
  }
  mapRows[newRow] = newRowString.toString();

  String result = mapRows.join('\n');
  print(result);
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




