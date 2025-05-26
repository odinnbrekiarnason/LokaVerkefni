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
  final int id;
  Direction? direction1;
  Direction? direction2;
  Direction? direction3;

  Door({required this.key, required this.id, this.onOpen, this.direction1, this.direction2, this.direction3});
}

class Room implements Door {
  String printMap;
  final RoomType type;
  final Player player;
  final String name;
  final String description;
  final Random random;
  final bool isThereChest;
  final bool isThereMonster;
  final Door door;
  final Chest chest;
  @override
  final int id;


  Room ({
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
  bool? onOpen;

  @override
  late Key key;

  @override
  Direction? direction1;

  @override
  Direction? direction2;

  @override
  Direction? direction3;

}



 




