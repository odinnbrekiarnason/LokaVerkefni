import '../Functions.dart';

int getId(RoomType type) {
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
    case RoomType.staircase:
      return 8;
    case RoomType.bedroom:
      return 9;
    case RoomType.emptyChamber:
      return 10;
    case RoomType.kitchen:
      return 11;
  }
}