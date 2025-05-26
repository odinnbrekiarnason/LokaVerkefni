import '../Functions.dart';
import 'dart:math';

abstract class Dungeon {
  Map<RoomType, String> rooms = {};
  int floors = 3;
}

enum RoomType {
  armory,
  diningRoom,
  emptyChamber,
  kitchen,
  library,
  throneRoom,
  treasureChamber,
  staircase,
  bedroom,
  startingPoint,
  storageRoom,
  //puzzleRoom
}

class RoomNames implements Dungeon {

  @override
  Map<RoomType, String> rooms = {
    RoomType.armory : "Armory",
    RoomType.diningRoom : "Dining Room",
    RoomType.emptyChamber : "Empty Chamber",
    RoomType.kitchen : "Kitchen",
    RoomType.library : "Library",
    RoomType.throneRoom: "Throne Room",
    RoomType.treasureChamber : "Treasure Chamber",
    RoomType.staircase : "Staircase",
    RoomType.bedroom : "Bedroom",
    RoomType.startingPoint : "Starting Point",
    RoomType.storageRoom : "Storage Room",
  };

  @override
  int floors = 3;

  String returnName(Player player) {
    RoomType playerPos = getPos(player);
    switch(playerPos) {
      case RoomType.startingPoint :
        return rooms.containsKey(RoomType.startingPoint) ? "Starting Point" : "Error";
      case RoomType.armory :
        return rooms.containsKey(RoomType.armory) ? "Armory" : "Error";
      default : return "String";
    }
  }

}

class FloorOne extends RoomNames {
  List<RoomType> completeList = [];

  List<RoomType> selectRandomRooms(List roomsOnFloorOne) {
    Random random = Random();
    List<RoomType> roomsOnFloorOne = [];
    //wrap function með check fyrir randomRooms annaðhvort.contains
    // eða checka hvort randomInt == randomInt aftur idk

    for(int i = 0; i < rooms.length; i++){
      int randomInt = random.nextInt(rooms.length);
      List<RoomType> typeList = RoomType.values;
      RoomType indexForName = typeList[randomInt];

      if(roomsOnFloorOne.contains(indexForName) && roomsOnFloorOne.contains(indexForName)){
        roomsOnFloorOne.remove(indexForName);
        //fyrst að checka fyrir duplicate a rooms sem eg vill hafa 2 af kannski
        //siðan checka fyrir duplicates a hinum
      } else if(roomsOnFloorOne.length < 4){
        roomsOnFloorOne.add(indexForName);
      }
    }

    for(int i = 0; i < roomsOnFloorOne.length; i++) {
      if(roomsOnFloorOne.contains(RoomType.staircase)){
        roomsOnFloorOne.remove(RoomType.staircase);
        roomsOnFloorOne.add(RoomType.staircase);
        break;
      } else {
        roomsOnFloorOne.add(RoomType.staircase);
        break;
      }
    }

    completeList = roomsOnFloorOne;
    return completeList;
  }
}

