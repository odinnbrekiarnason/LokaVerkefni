import '../Functions.dart';
import 'dart:io';

List movePlayer(Player player, RoomType type) {
  List<Room> tempList = [];
  RoomType roomType = player.getPos(player);


  switch(roomType) {
    case RoomType.startingPoint :
      print("Which direction would you like to move?\nPs. you move 2 spaces at a time");
      String moving = stdin.readLineSync().toString().toLowerCase();

      List startingRoom = [
  "+---------------door----------------+"
  "|                                   |"
  "|                                   |"
  "|                                   |"
  "|                p              door>"
  "|                               door>"
  "|                                   |"
  "|                                   |"
  "|                                   |"
  "+-----------------------------------+"
      ];

      switch(moving) {
        case "down" || "dow" || "d" :
          List tempMap = startingRoom;
          int index = findIndex(tempMap);
          print(index);
          tempMap.removeAt(index);
          tempMap.insert(index, " ");

          for(int i = 0; i < startingRoom.length; i++) {
          print(tempMap[i]);
          }
      }
      return startingRoom;

    case  RoomType.armory:
      print("Which direction would you like to move?\nPs. you move 2 spaces at a time");
      String moving = stdin.readLineSync().toString().toLowerCase();

      List armory = [
        "+----------------door---------------+",
        "| Crate           p           Armor |",
        "|                             Rack  |",
        "|              Monster              |",
        "| Weapon                            >",
        "| Rack                          door>",
        "|                                   >",
        "|                                   |",
        "|                                   |",
        "| Barrel                      Crate |",
        "+----------------door---------------+"
      ];

      switch(moving) {
        case "down" || "dow" || "d" :
          List tempMap = armory;
          print("top");
          int index = findIndex(tempMap);
          tempMap.removeAt(index);
          print("mid");
          tempMap.insert(index, " ");
          print(tempMap);
          print("bottom");

      }

      return armory;
    default : return tempList;
  }
}

int findIndex(List list) {
  String temp = "";
  int tempInt = 0;
  if(list.isNotEmpty) {
    for (int i = 0; i < list.length; i++) {
      temp = list[i];
      if (temp.contains("p")) {
        tempInt = temp.indexOf("p");
        break;
      }
    }
  }
  return tempInt;
}



