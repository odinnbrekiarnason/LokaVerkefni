import '../Functions.dart';
import 'dart:math';

enum Direction {
  up,
  down,
  right,
  left,
}

class Door {
  bool? onOpen;
  final Key key;
  Direction? direction1;
  Direction? direction2;
  Direction? direction3;

  Door({required this.key, this.onOpen, this.direction1, this.direction2, this.direction3});
}

class Room extends Chest implements Door {
  String printMap;
  final RoomType type;
  final Player player;
  final String name;
  final String id;
  final String description;
  final Random random;
  final bool isThereChest;
  final bool isThereMonster;
  final Door door;
  final Chest chest;


  Room ({
    required super.item,
    required this.type,
    required this.door,
    required this.player,
    required this.name,
    required this.id,
    required this.description,
    required this.printMap,
    Random? random,
    bool? isThereChest,
    bool? isThereMonster,
      }) :
        random = random ?? Random(),
        isThereChest = Random().nextDouble() < 0.2,
        chest = Random().nextDouble() < 0.2 ? spawnChest() : spawnEmptyChest(),
        isThereMonster = isThereMonster ?? Random().nextDouble() < 0.2;



  @override
  bool? onOpen = false;

  @override
  late Key key;

  RoomType returnRoomType(Player player) {
    return type;
  }

  String getId(Player player) {
    return id;
  }

  @override
  Direction? direction1;

  @override
  Direction? direction2;

  @override
  Direction? direction3;

    /*bool canOpenDoor = false;
    switch(canOpenDoor = false) {
      case player.keyItems.contains() :
    player.keyItems.remove(player.keyItems[0]);
    canOpenDoor = true;
    print("You opened the door with the key!");
     default :
    print("The door is locked.");
    print("You need a key to open the door.");
    canOpenDoor = false;

    return canOpenDoor ??
    }*/
  }

Chest spawnChest() {
  Random random = Random();
  bool chestOrNot = random.nextDouble() < 0.2;
  Chest chest = Chest(item: Items().getItemList());
  if(chestOrNot == true){
    chest = Chest(item: Items().getItemList());
  }
  return chest;
}

Chest spawnEmptyChest() {
  return EmptyChest(item: Items().noItem);
}

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

 




