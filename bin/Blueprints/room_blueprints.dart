import 'dart:io';
import 'dart:math';
import '../Functions.dart';


List<Room> roomCreation(List<dynamic> selectedRooms, Player player) {
  List<Room> createdRooms = [];
  List<dynamic> tempList = [];
  String tempMap = printRoomMap(player.getPos(player), player);

  for (int i = 0; i < selectedRooms.length; i++) {
    RoomType type = selectedRooms[i];

    switch (type) {
      case RoomType.startingPoint:
        createdRooms.add(Room(
            description: "Starting point of the dungeon",
            name: "Starting Point",
            isThereMonster: false,
            isThereChest: false,
            type: RoomType.startingPoint,
            door: Door(key: player.keyItems[0], onOpen: onOpen(player)),
            player: player,
            id: '1',
            printMap: tempMap,
            item: returnItemList()));
        player.position = RoomType.startingPoint;
        break;

      case RoomType.armory:
        createdRooms.add(Room(
            description: "A room filled with weapons and armor",
            name: "Armory",
            type: RoomType.armory,
            door: Door(key: player.keyItems[0], onOpen: onOpen(player)),
            player: player,
            id: '2',
            printMap: tempMap,
            item: returnItemList()));
        player.position = RoomType.armory;
        break;

      case RoomType.storageRoom:
        createdRooms.add(Room(
            description: "A dusty room for storing supplies",
            name: "Storage Room",
            type: RoomType.storageRoom,
            door: Door(key: player.keyItems[0], onOpen: onOpen(player)),
            player: player,
            id: '3',
            printMap: tempMap,
            item: returnItemList()));
        player.position = RoomType.storageRoom;
        break;

      case RoomType.library:
        createdRooms.add(Room(
            description: "A quiet room lined with bookshelves",
            name: "Library",
            type: RoomType.library,
            door: Door(key: player.keyItems[0], onOpen: onOpen(player)),
            player: player,
            id: '4',
            printMap: tempMap,
            item: returnItemList()));
        player.position = RoomType.library;
        break;

      case RoomType.diningRoom:
        createdRooms.add(Room(
            description: "A grand hall for feasts",
            name: "Dining Room",
            type: RoomType.diningRoom,
            door: Door(key: player.keyItems[0], onOpen: onOpen(player)),
            player: player,
            id: '5',
            printMap: tempMap,
            item: returnItemList()));
        player.position = RoomType.diningRoom;
        break;

      case RoomType.throneRoom:
        createdRooms.add(Room(
            description: "A majestic room with a royal throne",
            name: "Throne Room",
            type: RoomType.throneRoom,
            door: Door(key: player.keyItems[0], onOpen: onOpen(player)),
            player: player,
            id: '6',
            printMap: tempMap,
            item: returnItemList()));
        player.position = RoomType.throneRoom;
        break;

      case RoomType.treasureChamber:
        createdRooms.add(Room(
            description: "A vault filled with riches",
            name: "Treasure Chamber",
            type: RoomType.treasureChamber,
            door: Door(key: player.keyItems[0], onOpen: onOpen(player)),
            player: player,
            id: '7',
            printMap: tempMap,
            item: returnItemList()));
        player.position = RoomType.treasureChamber;
        break;

      case RoomType.staircase:
        createdRooms.add(Room(
            description: "A spiral staircase to another floor",
            name: "Staircase",
            type: RoomType.staircase,
            door: Door(key: player.keyItems[0], onOpen: onOpen(player)),
            player: player,
            id: '8',
            printMap: tempMap,
            item: returnItemList()));
        player.position = RoomType.staircase;
        break;

      case RoomType.bedroom:
        createdRooms.add(Room(
            description: "A cozy room for rest",
            name: "Bedroom",
            type: RoomType.bedroom,
            door: Door(key: player.keyItems[0], onOpen: onOpen(player)),
            player: player,
            id: '9',
            printMap: tempMap,
            item: returnItemList()
        ));
        player.position = RoomType.bedroom;
        break;

      default:
        print("Error: Unknown RoomType: $type");
        break;
    }
  }
  return createdRooms;
}

/*List getIndexOf(List<RoomType> rooms) {
List<RoomType> indexedRoom =  [rooms[0], rooms[1], rooms[2], rooms[3], rooms[4]];
  return indexedRoom;
}*/



