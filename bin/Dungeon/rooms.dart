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

  @override
  Function onOpen = (Player player) {
    print("The door is open!");
    print("You can now enter the next room!");
  };

 @override
  Direction get direction => whereDoor(door);
  
  bool canOpen(Player player) {
    bool canOpenDoor = false;
    if (player.keyItems.contains(key)) {
      onOpen();
      player.keyItems.remove(key);
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



