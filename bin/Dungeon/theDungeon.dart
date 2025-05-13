import '../Functions.dart';
import 'dart:math';

abstract class Dungeon {
  List rooms = [];
  int floors = 3;
}

class Rooms implements Dungeon {

  @override
  List rooms = [
    "Armory",
    "Dining Room",
    "Empty Chamber",
    "Kitchen",
    "Library",
    "Throne Room",
    "Treasure Chamber",
    "Staircase",
    "Bedroom",
  ];

  @override
  int floors = 3;

}

class FloorOne extends Rooms {
  List completeList = [];

  void selectRandomRooms(roomsOnFloorOne) {
    Random random = new Random();
    List<String> roomsOnFloorOne = [];
    //wrap function með check fyrir randomRooms annaðhvort.contains
    // eða checka hvort randomInt == randomInt aftur idk

    for(int i = 0; i < rooms.length; i++){
      int randomInt = random.nextInt(rooms.length);
      String indexForName = rooms[randomInt];

      if(roomsOnFloorOne.contains(indexForName) && roomsOnFloorOne.contains(indexForName)){
        roomsOnFloorOne.remove(indexForName * 0);
        //fyrst að checka fyrir duplicate a rooms sem eg vill hafa 2 af kannski
        //siðan checka fyrir duplicates a hinum
      } else if(roomsOnFloorOne.length < 4){
        roomsOnFloorOne.add(indexForName);
      }
    }

    for(int i = 0; i < roomsOnFloorOne.length; i++){
      if(roomsOnFloorOne.contains("Staircase")){
      } else {
        roomsOnFloorOne.add("Staircase");
      }
    }

    print(roomsOnFloorOne);
    completeList = roomsOnFloorOne;
  }

  void enterRoom() {
    selectRandomRooms(rooms);
    String roomDrawing = "-";
    for (int i = 0; i < completeList.length; i++) {
      print("+" + roomDrawing * completeList[i].length + "+");
      print("|" + completeList[i] + "|");
      print("+" + roomDrawing * completeList[i].length + "+");
    }
  }
}

