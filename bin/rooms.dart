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



  }
  String enterRoom(String room) {
  return "Your have entered $room";
  }
}