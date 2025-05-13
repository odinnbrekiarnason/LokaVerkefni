import '../Functions.dart';


class Room extends Rooms {
  final String name;
  final String id;
  final String description;
  final bool? isThereChest;

  Room({
    required this.name,
    required this.id,
    required this.description,
    this.isThereChest,
      });
}