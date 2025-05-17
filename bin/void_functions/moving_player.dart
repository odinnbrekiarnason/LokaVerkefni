import '../Functions.dart';

List movePlayer(Player player, Room type) {
  List<Room> tempList = [];
  RoomType roomType = type.returnRoomType();
  switch(roomType) {
    case  RoomType.armory:
      List armory = [
        "+----------------door---------------+",
        "| Crate           p           Armor |",
        "|                             Rack  |",
        "|              Monster              |",
        "| Weapon                            >",
        "| Rack                          door>",
        "|                                   >",
        "|                                   |",
        "|                                   |",
        "| Barrel                      Crate |",
        "+----------------door---------------+"
      ];
      return armory;
    case RoomType.startingPoint :
      List startingRoom = [
  "+---------------door----------------+",
  "|                                   |",
  "|                                   |",
  "|                                   |",
  "|                p              door>",
  "|                               door>",
  "|                                   |",
  "|                                   |",
  "|                                   |",
  "+-----------------------------------+"
      ];
      return startingRoom;
    default : return tempList;
  }
}


