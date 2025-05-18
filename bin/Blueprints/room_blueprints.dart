import 'dart:math';

import '../Functions.dart';


List<Room> roomCreation(List<dynamic> selectedRooms, Player player) {
  List<Room> createdRooms = [];

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
            printMap: printRoomMap(RoomType.startingPoint, player),
            item: Items().getItemList()));
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
  RoomType type = RoomType.startingPoint;
  bool canUOpen = false;
  if (player.keyItems[0].isKey == true) {
    player.keyItems.removeAt(0);
    print("you open the door and walk into the next room\nThe key evaporates!");
    player.movePlayer(player, type);
  } else {
    print("No key in your inventory");
  }
  return canUOpen;
}