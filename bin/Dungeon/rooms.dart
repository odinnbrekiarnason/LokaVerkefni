import '../Functions.dart';
import 'dart:math';

enum Direction {
  up,
  down,
  right,
  left,
}

class Door {
  final void onOpen;
  final Key key;
  final Direction direction;

  Door({required this.key, required this.onOpen, required this.direction});

}

class Room extends Chest implements Door {
  String Function() printMap;
  final RoomType type;
  final Player player;
  final String name;
  final String id;
  final String description;
  final Random random;
  final bool isThereChest;
  final bool isThereMonster;
  final Door door;


  Room ({
    required this.type,
    required this.door,
    required this.player,
    required this.name,
    required this.id,
    required this.description,
    required this.printMap,
    required super.item,
    Random? random,
    bool? isThereChest,
    bool? isThereMonster,
      }) : random = random ?? Random(), isThereChest = isThereChest ?? Random().nextDouble() < 0.2, isThereMonster = isThereMonster ?? Random().nextDouble() < 0.2;

  bool spawnChest() {
    return random.nextDouble() < 0.2;
  }

    String printRoomMap(RoomType type, Player player) {
    List<RoomType> typeList = RoomType.values;
    int randomInt = Random().nextInt(typeList.length);
    RoomType indexForName = typeList[randomInt];
    Chest chest = Chest(item: item);
    switch(indexForName) {
      case RoomType.startingPoint : 
        return """ 
        Hello, ${player.playerName} welcome to the dungeon!
This is your starting point and you will face many challenges here.
you will need to find a way out of the dungeon and defeat the monsters.
there are many rooms in the dungeon and you will need to find the key to open the door for each one!.
there will most likely be a monster in each room, so be careful!
also there will be a chest in each room, so be sure to open it!
if you need any help just type "help" and i will be there to help you!

  +---------------$door---------------+
  |                                   |   
  |                                   |
  |                                   |
  |             $player               >
  |                                   >
  |                                   |
  |                                   |
  |                                   |
  +-----------------------------------+
        """;

      case RoomType.armory :
       return """
  +---------------$door---------------+
  | Crate        $player        Armor |
  |                             Rack  |
  |             $Monster              |
  |                                   |
  | Weapon                            >
  | Rack                         $door> 
  |                                   >
  |                                   |
  |                                   |
  | $chest                      Crate |
  | Barrel                      Crate |
  +---------------$door---------------+
        """;
      case RoomType.diningRoom : return """ 
  +---------------$door---------------+
  |  Table       $player              |
  |                                   |
  |      Chair |--------| Chair       |
  |            |        |             |
  |      Chair |  Big   | Chair       |
  <            |  Dish  |             |
  <$door Chair |        | Chair       |
  |            |        |             |
  |      Chair |________| Chair       |
  |                                   |
  |                                   |
  | Crate                      Chairs |
  +---------------$door---------------+
        """;
      case RoomType.emptyChamber : return """ 
  +-----------------------------------+
  | Dust                       Crate  |
  | Pile                              |
  |                Barrel             |
  |                                   |
  <                           Cobwebs |
  <           Barrel                  |
  |                                   |
  |                     Monster       |
  | Dust                              |
  | Pile                        Junk  | 
  +-----------------------------------+
        """;
      case RoomType.kitchen : return """ 
  +---------------------------------+
  | Oven |            | *     * |   |
  | Oven |            +---------+   |
  |------+                          |
  |                                 >
  |------+                     $door>
  |Fridge|                          >
  |------+                          |
  |                 +---------------|
  | Cabinet         |  Pans    Pots |
  +---------------------------------+
        """;
      case RoomType.library : return """ 
  +-------------------------------+
  | Shelves |              Book   |
  |---------+              Stack  |
  |  Book                         |
  |                               |
  |---------+                     |
  | Shelves |                     >
  |---------+                $door>                               
  |                               >
  |                               |
  |---------+                     |
  | Shelves |                     |
  |---------+            +----+   |
  |$Chest                |Desk|   |
  |                      |Lamp|   |
  |---------+            |Desk|   |
  | Shelves |            +----+   |
  |---------+                     |
  |                               |
  |                               |
  +-------------$door-------------+
      """;
      default : return "banana";
    }
  }

  @override
  Function onOpen = () {
    print("The door is open!");
    print("You can now enter the next room!");
  };

 @override
  Direction get direction => whereDoor(door);
  
  bool canOpen(Player player) {
    bool canOpenDoor = false;
    if (player.backpack.contains(key)) {
      onOpen();
      player.backpack.remove(key);
      canOpenDoor = true;
      print("You opened the door with the key!");
    } else {
      print("The door is locked.");
      print("You need a key to open the door.");
      canOpenDoor = false;
    }
    return canOpenDoor;
  }

  @override
  Key key = Key(name: "Key", description: "A shiny key");
  
   
  

  Direction whereDoor(Door door) {
    List<Direction> where = Direction.values;
    int randomInt = Random().nextInt(where.length);
    Direction indexForName = where[randomInt];
    switch(indexForName) {
      case Direction.up : 
       indexForName = Direction.up;
       print("The door is up");
      return indexForName;

      case Direction.down : 
      indexForName = Direction.down;
      print("The door is down");
      return indexForName;

      case Direction.right : 
      indexForName = Direction.right;
      print("The door is right");
      return indexForName;

      case Direction.left : 
      indexForName = Direction.left;
      print("The door is left");
      return indexForName;
    }
  }
  
 
}



