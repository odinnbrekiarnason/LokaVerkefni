import '../bin/Functions.dart';
import 'dart:math';

abstract class Rooms {
  List rooms = [];
  late int floors;

}
enum RoomContent {
  armory,
  diningRoom,
  emptyChamber,
  kitchen,
  library,
  throneRoom,
  treasureChamber,
  staircase,
  bedroom,
}

class currentRoom extends Chest {
  final String name;
  final String id;
  final String description;
  final bool? isThereChest;
  final List? items;

  currentRoom({
   required this.name,
    required this.id,
    required this.description,
    this.isThereChest,
    this.items
});
}




class RoomNames implements Rooms {
  @override
  Map<> {
  /*Roomcontent.armory."Armory",
  "Dining Room",
  "Empty Chamber",
  "Kitchen",
  "Library",
  "Throne Room",
  "Treasure Chamber",
  "Staircase",
  "Bedroom",*/
  };


  @override
  int floors = 1;

}

class FloorOne extends RoomNames {
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

    for(String room in roomsOnFloorOne){
      if(room != "Staircase"){

      }
    }

    print(roomsOnFloorOne);
    completeList = roomsOnFloorOne;
  }


  void enterRoom(List room) {
    selectRandomRooms(rooms);
    String roomDrawing = "-";
    for (int i = 0; i < completeList.length; i++) {
      print("+" + roomDrawing * completeList[i].length + "+");
      print("|" + completeList[i] + "|");
      print("+" + roomDrawing * completeList[i].length + "+");

    }
  }
}

