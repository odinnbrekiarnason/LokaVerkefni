import '../Functions/function_exporter.dart';

int getRoomId(RoomType type) {
  switch (type) {
    case RoomType.startingPoint:
      return 0;
    case RoomType.armory:
      return 1;
    case RoomType.storageRoom:
      return 2;
    case RoomType.library:
      return 3;
    case RoomType.diningRoom:
      return 4;
    case RoomType.throneRoom:
      return 5;
    case RoomType.treasureChamber:
      return 6;
    case RoomType.bedroom:
      return 7;
    case RoomType.emptyChamber:
      return 8;
    case RoomType.kitchen:
      return 9;
    case RoomType.bossRoom:
      return 10;
    case RoomType.hallway:
      return 0;
  }
}

bool idCheck(int i, int c)  {
  if(i == c){
    return true;
  }
  else {
    return false;
  }
}