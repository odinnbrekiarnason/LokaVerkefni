import 'dart:io';
import 'dart:math';

import '../Functions.dart';


List<Room> roomCreation(List<dynamic> selectedRooms, Player player) {
  List<Room> createdRooms = [];
  List<dynamic> tempList = [];
  String tempMap = printRoomMap(player.getPos(player), player);

  for(int i = 0; i < selectedRooms.length; i++) {
    RoomType type = selectedRooms[i];
    //RoomType tempType = RoomType.startingPoint;
    switch(type) {
      case RoomType.startingPoint :
        createdRooms.add( Room (
            description: "Starting point of the dungeon",
            name: "Starting point",
            isThereMonster: false,
            type: RoomType.startingPoint,
            door: Door(key: player.keyItems[0],onOpen: onOpen(player)),
            player: player,
            id: '1',
            printMap: tempMap,
            item: Items().getItemList(tempList)));
            player.position = RoomType.startingPoint;
            print(tempList);
      default : "Error";
    break;
    }
  }
  //
    return createdRooms;
}

/*List getIndexOf(List<RoomType> rooms) {
List<RoomType> indexedRoom =  [rooms[0], rooms[1], rooms[2], rooms[3], rooms[4]];
  return indexedRoom;
}*/



bool onOpen(Player player) {
  RoomType type = player.getPos(player);
  bool canUOpen = false;
  if (player.keyItems[0].isKey == true) {
    print("Looks like you have the key for this door!\nWould you like to go to the next room?\nType yes or no");
    String answer = stdin.readLineSync().toString().toLowerCase().trim();
    canUOpen = true;
    switch(answer) {
      case "yes" || "y" || "ye" || "ja" :
        player.keyItems.removeAt(0);
        print("you open the door and walk into the next room\nThe key evaporates!");
        player.movePlayer(player, type);

      case "no" || "n" || "na" || "nei" :
        print("Remember you can open the door at anytime by typing in open door");
        return canUOpen = false;
    }
  } else {
    print("No key in your inventory");
  }
  return canUOpen;
}