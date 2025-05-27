import '../Functions.dart';


List<Room> roomCreation(List<dynamic> selectedRooms, Player player) {
  List<Room> createdRooms = [];
  String tempMap = currentRoomMap(getPos(player), player);
  Key tempKey = Key(name: "Temp", description: "Temp", id: 0);

  for (int i = 0; i < selectedRooms.length; i++) {
    RoomType type = selectedRooms[i];

    switch (type) {
      case RoomType.startingPoint :
        createdRooms.add(Room(
          description: "Starting point of the dungeon",
          name: "Starting Point",
          isThereMonster: false,
          isThereChest: false,
          type: RoomType.startingPoint,
          door: Door(key: player.keyItems[0], onOpen: onOpen(player), id: 1),
          player: player,
          id: 1,
          printMap: tempMap,
    ));
        break;

      case RoomType.armory :
        createdRooms.add(Room(
          description: "A room filled with weapons and armor",
          name: "Armory",
          type: RoomType.armory,
          door: Door(key: tempKey, onOpen: onOpen(player), id: 2),
          player: player,
          id: 2,
          printMap: tempMap,
          ));
        break;

      case RoomType.storageRoom :
        createdRooms.add(Room(
          description: "A dusty room for storing supplies",
          name: "Storage Room",
          type: RoomType.storageRoom,
          door: Door(key: tempKey, onOpen: onOpen(player), id: 3),
          player: player,
          id: 3,
          printMap: tempMap,
           ));
        break;

      case RoomType.library :
        createdRooms.add(Room(
          description: "A quiet room lined with bookshelves",
          name: "Library",
          type: RoomType.library,
          door: Door(key: tempKey, onOpen: onOpen(player), id: 4),
          player: player,
          id: 4,
          printMap: tempMap,
            ));
        break;

      case RoomType.diningRoom :
        createdRooms.add(Room(
          description: "A grand hall for feasts",
          name: "Dining Room",
          type: RoomType.diningRoom,
          door: Door(key: tempKey, onOpen: onOpen(player), id: 5),
          player: player,
          id: 5,
          printMap: tempMap,
            ));
        break;

      case RoomType.throneRoom :
        createdRooms.add(Room(
          description: "A majestic room with a royal throne",
          name: "Throne Room",
          type: RoomType.throneRoom,
          door: Door(key: tempKey, onOpen: onOpen(player), id: 6),
          player: player,
          id: 6,
          printMap: tempMap,
            ));
        break;

      case RoomType.treasureChamber :
        createdRooms.add(Room(
          description: "A vault filled with riches",
          name: "Treasure Chamber",
          type: RoomType.treasureChamber,
          door: Door(key: tempKey, onOpen: onOpen(player), id: 7),
          player: player,
          id: 7,
          printMap: tempMap,
            ));
        break;

      case RoomType.staircase :
        createdRooms.add(Room(
          description: "A spiral staircase to another floor",
          name: "Staircase",
          type: RoomType.staircase,
          door: Door(key: tempKey, onOpen: onOpen(player), id: 8),
          player: player,
          id: 8,
          printMap: tempMap,
            ));
        break;

      case RoomType.bedroom :
        createdRooms.add(Room(
          description: "A cozy room for rest",
          name: "Bedroom",
          type: RoomType.bedroom,
          door: Door(key: tempKey, onOpen: onOpen(player), id: 9),
          player: player,
          id: 9,
          printMap: tempMap,
        ));
        break;
        
      case RoomType.emptyChamber : 
        createdRooms.add(Room(
            description: "Looks to be a empty room..",
            name: "Empty chamber",
            type: RoomType.emptyChamber,
            door: Door(key: tempKey, id: 10),
            player: player,
            id: 10,
            printMap: tempMap
        ));
        break;
        
      case RoomType.kitchen :
        createdRooms.add(Room(
            description: "A room full of kitchen appliances",
            name: "Kitchen",
            type: RoomType.kitchen,
            door: Door(key: tempKey, id: 11),
            player: player,
            id: 11,
            printMap: tempMap
        ));
        break;

      /*case RoomType.puzzleRoom :
        createdRooms.add(DiceRoom(
            item: returnItemList(),
            type: type,
            door: Door(key: player.keyItems[0], onOpen: onOpen(player)),
            player: player,
            name: "Puzzle Room",
            id: "puzzle!",
            description:
            "Its a puzzleRoom the rules are simple you only need to roll a dice and get lucky!",
            printMap: tempMap,
            puzzle: guessTheNumber(),
            answer: ,
            correctAnswer: ,
        ));*/
    }
  }
  return createdRooms;
}




