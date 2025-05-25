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
      return moveSpaces(startingRoomMap, moving, returnRowLength(startingRoomMap), returnColLength(startingRoomMap));

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

String moveSpaces(String map, String direction, int rows, int columns) {

  List<String> mapRows = map.split("\n");

  int playerRow = -1;
  int playerCol = -1;
  for(int i = 0; i < mapRows.length; i++){
    int col = mapRows[i].indexOf("P");
    if(col != -1) {
      playerRow = i;
      playerCol = col;
      break;
    }
  }
  if(playerRow == -1) {
    print("Error: No player found!");
    return map;
  }

  int newRow = playerRow;
  int newCol = playerCol;
  switch (direction) {
    case "up" || "upp" || "u":
      newRow -= 2;
      break;
    case 'down' || "dow" || "d":
      newRow += 2;
      break;
    case 'left' || "lef" || "l":
      newCol -= 2;
      break;
    case 'right' || "rig" || "r":
      newCol += 2;
      break;
    default:
      print("Please input a valid direction\nup, down, left, right");
      return map;
  }

  if(newRow < 1 || newRow >= rows - 1 || newCol < 1 || newCol >= columns - 1) {
    print("Cannot move: out of bounds!");
    return map;
  }

  String dest = mapRows[newRow].length > newCol ? mapRows[newRow][newCol] : ' ';
  if (dest != '.' && dest != ' ' && !['^', 'v', '<', '>'].contains(dest)) {
    print("Cannot move: blocked by obstacle");
    return map;
  }

  StringBuffer newRowString = StringBuffer();
  for (int c = 0; c < mapRows[playerRow].length; c++) {
    newRowString.write(c == playerCol ? ' ' : mapRows[playerRow][c]);
  }
  mapRows[playerRow] = newRowString.toString();

  newRowString = StringBuffer();
  for (int c = 0; c < mapRows[newRow].length; c++) {
    newRowString.write(c == newCol ? 'P' : mapRows[newRow][c]);
  }
  mapRows[newRow] = newRowString.toString();

  String result = mapRows.join('\n');
  print(result);
  return result;
}

int returnColLength(String map) {
  var splitMap = map.split("\n");
  return splitMap[0].length;
}

int returnRowLength(String map) {
  var splitMap = map.split("\n");
  return splitMap.length;
}




