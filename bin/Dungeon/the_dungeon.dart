import '../Functions.dart';
import 'dart:math';

abstract class Dungeon {
  Map<RoomType, String> rooms = {};
  int floors = 3;
}

//nota roomtype fyrir switch RoomType.armory = "armory"
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
      if(roomsOnFloorOne.contains("Staircase")){
        roomsOnFloorOne.remove("Staircase");
        roomsOnFloorOne.add(RoomType.staircase);
      } else {
        roomsOnFloorOne.add(RoomType.staircase);
      }
    }

    print(roomsOnFloorOne);
    completeList = roomsOnFloorOne;
    return completeList;
  }
}

