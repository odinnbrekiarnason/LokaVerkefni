import '../Functions.dart';
import 'dart:io';

String movePlayer(Player player, RoomType type) {
  String tempList = "";
  //RoomType roomType = player.getPos(player);


  switch(type) {
    case RoomType.startingPoint :
      print("Which direction would you like to move?\nPs. you move 2 spaces at a time");
      String moving = stdin.readLineSync().toString().toLowerCase();
      String moveDownPlaceHolder = " ";
      String startingRoomMap = """
      +---------------door----------------+
      |                U                  |
      |                                   |
      |             L  P  R               |
      |                               door>
      |                D              door>
      |                               door>
      |                                   |
      |                                   |
      |                                   |
      +-----------------------------------+
      """;

      switch(moving) {
        case "down" || "dow" || "d" :
          String tempMap = startingRoomMap;
          print(tempMap);
          int index = findPlayer(tempMap);
          tempMap = tempMap.replaceFirst("P", " ", index);
          print(tempMap);
          return tempMap;
      }
      return startingRoomMap;

    case  RoomType.armory:
      print("Which direction would you like to move?\nPs. you move 2 spaces at a time");
      String moving = stdin.readLineSync().toString().toLowerCase();

      String armory = """
        +----------------door---------------+
        | Crate           p           Armor |
        |                             Rack  |
        |              Monster              |
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

int findPlayer(String list) {
  //String temp = "";
  int tempInt = 0;
  if(list.isNotEmpty) {
    for (int i = 0; i < list.length; i++) {
      String temp =  list[i];
      if (temp == "p") {
        tempInt = list.indexOf("p");
      }
    }
  }
  return tempInt;
}



