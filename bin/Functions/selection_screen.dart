import '../Functions/function_exporter.dart';

void selection(Player player, RoomType room, String input) {
  print("1. Backpack\n2. Move player\n3. Check player info\nPlease type 1, 2 or 3 to select option");

  switch(input) {
    case "1":
      print("You open your backpack");
      openBackPack(player);
    case "2":
      bool moving = true;
      while(moving == true) {
        RoomType type = player.position;
        switch(player.position) {
          case RoomType.startingPoint:
            startingPoint = movePlayer(player, player.position, startingPoint);
          case RoomType.armory:
            armory = movePlayer(player, type, armory);
          case RoomType.diningRoom:
            diningRoom = movePlayer(player, type, diningRoom);
          case RoomType.emptyChamber:
            emptyChamber = movePlayer(player, type, emptyChamber);
          case RoomType.kitchen:
            kitchen = movePlayer(player, type, kitchen);
          case RoomType.library:
            library = movePlayer(player, type, library);
          case RoomType.throneRoom:
            throneRoom = movePlayer(player, type, throneRoom);
          case RoomType.bossRoom:
            bossRoom = movePlayer(player, type, bossRoom);
          case RoomType.bedroom:
            bedroom = movePlayer(player, type, bedroom);
          case RoomType.treasureChamber:
            treasureRoom = movePlayer(player, type, treasureRoom);
          case RoomType.storageRoom:
            storageRoom = movePlayer(player, type, storageRoom);
          case RoomType.hallway:
            hallway = movePlayer(player, type, hallway);
        }
      }
    case "3":
      getPlayerInfo(player);
    default :
      print("Invalid input");
  }
}

String beforeFirstInput(RoomType room) {
  String s = """
You walk into the ${room.name}
You see ${getRoomDescription(room)}
1. Backpack\n2. Move player\n3. Check player stats
Please type 1, 2 etc. to select option
""";
  print(s);
  return "";
}

