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

  //List mappedNames = RoomNames.rooms.map();


  @override
  int floors = 1;

}

class FloorOne extends RoomNames {
  List completeList = [];

  void selectRandomRooms(roomsOnFloorOne) {
    Random random = new Random();
    List roomsOnFloorOne = [];
    //wrap function með check fyrir randomRooms annaðhvort.contains
    // eða checka hvort randomInt == randomInt aftur idk

    for(int i = 0; i < rooms.length; i++){
      int randomInt = random.nextInt(rooms.length);
      String indexForName = rooms[randomInt];
      print(indexForName);
      if(roomsOnFloorOne.contains(indexForName) && roomsOnFloorOne.contains(indexForName)){
        roomsOnFloorOne.remove(indexForName * 0);
        Exception(roomsOnFloorOne.contains("Treasure Chamber") || roomsOnFloorOne.contains("Empty Chamber"));
        //fyrst að checka fyrir duplicate a rooms sem eg vill hafa 2 af kannski
        //siðan checka fyrir duplicates a hinum
      } else if(roomsOnFloorOne.length < 6){
        roomsOnFloorOne.add(indexForName);
       }
    }
    print(roomsOnFloorOne);
    completeList = roomsOnFloorOne;
  }


  String enterRoom(String room) {
  return "Your have entered $room";
  }
}

