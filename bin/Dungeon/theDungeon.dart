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
  bedroom;
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
  };

  @override
  int floors = 3;

}

class FloorOne extends RoomNames {
  List completeList = [];

  void selectRandomRooms(List roomsOnFloorOne) {
    Random random = new Random();
    List<String> roomsOnFloorOne = [];
    //wrap function með check fyrir randomRooms annaðhvort.contains
    // eða checka hvort randomInt == randomInt aftur idk

    for(int i = 0; i < rooms.length; i++){
      int randomInt = random.nextInt(rooms.length);
      List<RoomType> typeList = RoomType.values;
      String indexForName = typeList[randomInt].name;

      if(roomsOnFloorOne.contains(indexForName) && roomsOnFloorOne.contains(indexForName)){
        roomsOnFloorOne.remove(indexForName * 0);
        //fyrst að checka fyrir duplicate a rooms sem eg vill hafa 2 af kannski
        //siðan checka fyrir duplicates a hinum
      } else if(roomsOnFloorOne.length < 4){
        roomsOnFloorOne.add(indexForName);
      }
    }

    for(int i = 0; i < roomsOnFloorOne.length; i++) {
      if(roomsOnFloorOne.contains("Staircase")){
        roomsOnFloorOne.remove("Staircase");
        roomsOnFloorOne.add("Staircase");
      } else {
        roomsOnFloorOne.add("Staircase");
      }
    }

    print(roomsOnFloorOne);
    completeList = roomsOnFloorOne;
  }

  void enterRoom(Room room) {
    String roomDrawing = "-";
    for (int i = 0; i < completeList.length; i++) {
      print(""""
      +${roomDrawing * completeList[i].length}+
      |${completeList[i]}|
      +${roomDrawing * completeList[i].length}+
      """);
    }
  }
}

