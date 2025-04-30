import 'dart:math';

abstract class Rooms {
  List rooms = [];
  late int floors;

}

class RoomNames implements Rooms {
  @override
  List rooms = [
    "Armory",
    "Dining Room",
    "Empty Chamber",
    "Kitchen",
    "Library",
    "Throne Room",
    "Treasure Chamber",
    "Staircase"
  ];

  @override
  int floors = 1;

}

class FloorOne extends RoomNames {
  List roomsOnFloorOne = [];


  void selectRandomRooms() {
    Random random = new Random();
    int randomInt = random.nextInt(rooms.length);

    for(int i = 0; i <= rooms.length - 5; i++){
    roomsOnFloorOne.add(rooms[randomInt]);
    if(roomsOnFloorOne.contains("Throne Room")){
      //wrap function með check fyrir randomRooms annaðhvort.contains eða checka hvort randomInt == randomInt aftur idk
      }
    }
  }


  String enterRoom(String room) {
  return "Your have entered $room";
  }
}

