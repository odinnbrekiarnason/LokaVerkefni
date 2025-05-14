import '../Functions.dart';
import 'dart:math';

enum Direction {
  up,
  down,
  right,
  left,
}

class Door<T> {
  final T door;
  final Function onOpen;
  final Item key;
  final Direction direction;

  Door({required this.door, required this.key, required this.onOpen, required this.direction});

}

class Room extends Chest implements Door {
  String Function() printMap;
  final String name;
  final String id;
  final String description;
  final Random random;
  final bool isThereChest;
  final bool isThereMonster;


  Room({
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

    String printRoomMap(RoomType type){
    List<RoomType> typeList = RoomType.values;
    int randomInt = Random().nextInt(typeList.length);
    RoomType indexForName = typeList[randomInt];
    switch(indexForName){
      case RoomType.armory : return """
  +---------------$door---------------+
  | Crate                       Armor |
  |                             Rack  |
  |             Monster               |
  |                                   |
  | Weapon                            >
  | Rack         $Chest          $door> 
  |                                   >
  |                                   |
  |                                   |
  |                             Crate |
  | Barrel                      Crate |
  +---------------$door---------------+
        """;
      case RoomType.diningRoom : return """ 
  +---------------$door---------------+
  |  Table                            |
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
  Type get door => throw UnimplementedError();

  @override
  Item get key => throw UnimplementedError();

  @override
  Function get onOpen => throw UnimplementedError();

  @override
  Direction get direction => throw UnimplementedError();

  String whereDoor(){
    Random random = Random();
    int randomInt = random.nextInt(RoomNames().rooms.length);

    List<Direction> whereTo = Direction.values;
    String thisWay = whereTo[1].name;
    return thisWay;
  }
}



