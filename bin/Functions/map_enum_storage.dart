import '../Functions/function_exporter.dart';

const Map<String, dynamic> roomConnect = {
  "connections": roomConnections,
  "directions": roomDirections
};


const Map<RoomType, List<Direction>> roomDirections = {
  RoomType.startingPoint: [Direction.down, Direction.right, Direction.up],
  RoomType.armory: [Direction.up, Direction.right, Direction.down],
  RoomType.diningRoom: [Direction.down, Direction.right],
  RoomType.kitchen: [Direction.right, Direction.left],
  RoomType.storageRoom: [Direction.left, Direction.down],
  RoomType.emptyChamber: [Direction.up, Direction.down, Direction.right],
  RoomType.library: [Direction.up, Direction.left],
  RoomType.throneRoom: [Direction.down],
  RoomType.bossRoom: [Direction.up],
  RoomType.bedroom: [Direction.left, Direction.up],
  RoomType.treasureChamber: [Direction.left, Direction.down],
  RoomType.hallway: [Direction.left, Direction.down, Direction.up, Direction.right],
};

const Map<RoomType, List<RoomType>> roomConnections = {
  RoomType.startingPoint: [RoomType.armory, RoomType.storageRoom, RoomType.diningRoom],
  RoomType.armory: [RoomType.startingPoint, RoomType.hallway, RoomType.emptyChamber],
  RoomType.diningRoom: [RoomType.startingPoint, RoomType.kitchen],
  RoomType.kitchen: [RoomType.diningRoom, RoomType.treasureChamber],
  RoomType.storageRoom: [RoomType.startingPoint, RoomType.library],
  RoomType.emptyChamber: [RoomType.armory, RoomType.bossRoom, RoomType.bedroom],
  RoomType.library: [RoomType.storageRoom, RoomType.hallway],
  RoomType.throneRoom: [RoomType.hallway],
  RoomType.bossRoom: [RoomType.storageRoom],
  RoomType.bedroom: [RoomType.emptyChamber, RoomType.hallway],
  RoomType.treasureChamber: [RoomType.kitchen, RoomType.storageRoom],
  RoomType.hallway: [RoomType.armory, RoomType.bedroom, RoomType.throneRoom, RoomType.library],
};

String getRoomDescription(RoomType type) {
  switch(type) {
    case RoomType.startingPoint: return "The first room of the dungeon, Welcome!";
    case RoomType.armory: return "A room filled with weapons and armor";
    case RoomType.diningRoom: return "A grand hall for feasts";
    case RoomType.emptyChamber: return "Looks to be a empty room..";
    case RoomType.kitchen: return "A room full of kitchen appliances";
    case RoomType.library: return "A quiet room lined with bookshelves";
    case RoomType.throneRoom: return "A majestic room with a royal throne";
    case RoomType.treasureChamber: return "A vault filled with riches";
    case RoomType.bossRoom: return "The bossroom be careful!";
    case RoomType.bedroom: return "A cozy room for rest";
    case RoomType.storageRoom: return "A dusty room for storing supplies";
    case RoomType.hallway: return "A Long hallway, i wonder where it leads";
  }
}

enum Direction {
  up,
  down,
  right,
  left,
}

enum RoomType {
  armory,
  diningRoom,
  emptyChamber,
  kitchen,
  library,
  throneRoom,
  treasureChamber,
  bossRoom,
  bedroom,
  startingPoint,
  storageRoom,
  hallway,
  //puzzleRoom
}