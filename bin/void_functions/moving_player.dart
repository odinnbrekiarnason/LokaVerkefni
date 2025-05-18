import '../Functions.dart';
import 'dart:io';

List movePlayer(Player player, Room type) {
  List<Room> tempList = [];
  RoomType roomType = type.returnRoomType(player);
  switch(roomType) {
    case RoomType.startingPoint :
      List startingRoom = [
  "+---------------door----------------+",
  "|                                   |",
  "|                                   |",
  "|                                   |",
  "|                p              door>",
  "|                               door>",
  "|                                   |",
  "|                                   |",
  "|                                   |",
  "+-----------------------------------+"
      ];
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
      RoomNames roomNames = RoomNames();
      moving == roomNames.returnName(player);
      switch(moving) {
        case "down" :
          int index = findIndex(armory);
          armory.removeAt(index);
          armory.insert(index, " ");
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
        for (int j = 0; j < temp.length; j++) {
          if (temp[j] == "p") {
            print("playerIndex at $j");
            return j;
          }
        }
      }
    }
  } else {
    return tempInt;
  }
  return tempInt;
}



