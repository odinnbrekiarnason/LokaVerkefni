import '../Functions.dart';


List<Room> roomCreation(List<RoomType> selectedRooms, Player player) {
  List<Room> createdRooms = [];
  String tempMap = ""; //currentRoomMap(getPos(player), player);
  Chest chest = Chest(item: returnItemList());

  for (int i = 0; i < selectedRooms.length; i++) {
    RoomType type = selectedRooms[i];

    switch (type) {
      case RoomType.startingPoint :
        createdRooms.add(Room(
          chest,
          description: "Starting point of the dungeon",
          name: "Starting Point",
          type: RoomType.startingPoint,
          player: player,
          id: 0,
          printMap: tempMap,
          key: Items().keys[0],
    ));
        break;

      case RoomType.armory :
        createdRooms.add(Room(
          chest,
          description: "A room filled with weapons and armor",
          name: "Armory",
          type: RoomType.armory,
          player: player,
          id: 2,
          printMap: tempMap,
          key: Items().keys[1],
          ));
        break;

      case RoomType.storageRoom :
        createdRooms.add(Room(
          chest,
          description: "A dusty room for storing supplies",
          name: "Storage Room",
          type: RoomType.storageRoom,
          player: player,
          id: 3,
          printMap: tempMap,
          key: Items().keys[2],
           ));
        break;

      case RoomType.library :
        createdRooms.add(Room(
          chest,
          description: "A quiet room lined with bookshelves",
          name: "Library",
          type: RoomType.library,
          player: player,
          id: 4,
          printMap: tempMap,
          key: Items().keys[3]
            ));
        break;

      case RoomType.diningRoom :
        createdRooms.add(Room(
          chest,
          description: "A grand hall for feasts",
          name: "Dining Room",
          type: RoomType.diningRoom,
          player: player,
          id: 5,
          printMap: tempMap,
          key: Items().keys[4]
            ));
        break;

      case RoomType.throneRoom :
        createdRooms.add(Room(
          chest,
          description: "A majestic room with a royal throne",
          name: "Throne Room",
          type: RoomType.throneRoom,
          player: player,
          id: 6,
          printMap: tempMap,
          key: Items().keys[5]
            ));
        break;

      case RoomType.treasureChamber :
        createdRooms.add(Room(
          chest,
          description: "A vault filled with riches",
          name: "Treasure Chamber",
          type: RoomType.treasureChamber,
          player: player,
          id: 7,
          printMap: tempMap,
          key: Items().keys[6]
            ));
        break;

      case RoomType.bedroom :
        createdRooms.add(Room(
          chest,
          description: "A cozy room for rest",
          name: "Bedroom",
          type: RoomType.bedroom,
          player: player,
          id: 8,
          printMap: tempMap,
          key: Items().keys[7]
        ));
        break;
        
      case RoomType.emptyChamber : 
        createdRooms.add(Room(
            chest,
            description: "Looks to be a empty room..",
            name: "Empty chamber",
            type: RoomType.emptyChamber,
            player: player,
            id: 9,
            printMap: tempMap,
            key: Items().keys[8]
        ));
        break;
        
      case RoomType.kitchen :
        createdRooms.add(Room(
            chest,
            description: "A room full of kitchen appliances",
            name: "Kitchen",
            type: RoomType.kitchen,
            player: player,
            id: 10,
            printMap: tempMap,
            key: Items().keys[9]
        ));
        break;

      case RoomType.bossRoom :
        createdRooms.add(Room(
          chest,
          description: "The bossroom be careful!",
          name: "Staircase",
          type: RoomType.bossRoom,
          player: player,
          id: 11,
          printMap: tempMap,
          key: Items().keys[10],
        ));
        break;

      case RoomType.hallway :
        createdRooms.add(Room(
            chest,
            type: type,
            player: player,
            name: "Hallway",
            description: "A Long hallway, i wonder where it leads",
            printMap: tempMap,
            id: 0,
        ));

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




