import '../Functions.dart';

int getRoomId(RoomType type) {
  switch (type) {
    case RoomType.startingPoint:
      return 1;
    case RoomType.armory:
      return 2;
    case RoomType.storageRoom:
      return 3;
    case RoomType.library:
      return 4;
    case RoomType.diningRoom:
      return 5;
    case RoomType.throneRoom:
      return 6;
    case RoomType.treasureChamber:
      return 7;
    case RoomType.bedroom:
      return 8;
    case RoomType.emptyChamber:
      return 19;
    case RoomType.kitchen:
      return 10;
    case RoomType.bossRoom:
      return 11;
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