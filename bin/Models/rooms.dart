import '../Functions.dart';
import 'dart:math';

class Door {
  Function? onOpen;
  final Key? key;
  final int id;
  Direction? direction1;
  Direction? direction2;
  Direction? direction3;

  Door({this.key, required this.id, this.onOpen, this.direction1, this.direction2, this.direction3});
}

class Room extends Door {
  String printMap;
  final RoomType type;
  final Player player;
  final String name;
  final String description;
  final Chest chest;


  Room (this.chest, {
    required this.type,
    required this.player,
    required this.name,
    required this.description,
    required this.printMap,
    required super.id,
    super.key,
      });

}



 




