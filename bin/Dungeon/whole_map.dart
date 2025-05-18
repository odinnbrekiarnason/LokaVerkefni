import '../Functions.dart';
import 'dart:math';

/*void showMap(){
  print("""
 [Dining Room] ↔ [Kitchen]
     ↕
[>StartingPoint<] ↔ [Storage Room] 
     ↕                       ↕
  [Armory] ↔ [Hallway] ↔ [Library]
     ↕
[Storage Room] 
     ↕
[Boss Room] ↔ [staircase] 
  """
);
}*/

String printRoomMap(RoomType type, Player player) {
  switch(type) {                                                                  //was //List<RoomType> typeList = RoomType.values; //   int randomInt = Random().nextInt(typeList.length);   //   RoomType indexForName = typeList[randomInt];
    case RoomType.startingPoint :
      return """ 
        Hello, ${player.playerName} welcome to the dungeon!
This is your starting point and you will face many challenges here.
you will need to find a way out of the dungeon and defeat the monsters.
there are many rooms in the dungeon and you will need to find the key to open the door for each one!.
there will most likely be a monster in each room, so be careful!
also there will be a chest in each room, so be sure to open it!
if you need any help just type "help" and i will be there to help you!

  +----------------vvv----------------+
  |                                   |   
  |                                   |
  |                                   |
  |              player               >
  |                                   >
  |                                   |
  |                                   |
  |                                   |
  +-----------------------------------+
        """;

    case RoomType.armory :


      return """
  +----------------door---------------+
  | Crate         player        Armor |
  |                             Rack  |
  |              Monster              |
  |                                   |
  | Weapon                            >
  | Rack                          door> 
  |                                   >
  |                                   |
  |                                   |
  |  chest                      Crate |
  | Barrel                      Crate |
  +----------------door---------------+
        """;
    case RoomType.diningRoom : return """ 
  +----------------door---------------+
  |  Table        player              |
  |                                   |
  |      Chair |--------| Chair       |
  |            |        |             |
  |      Chair |  Big   | Chair       |
  <            |  Dish  |             |
  < door Chair |        | Chair       |
  |            |        |             |
  |      Chair |________| Chair       |
  |                                   |
  |                                   |
  | Crate                      Chairs |
  +----------------door---------------+
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
  |------+                      door>
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
  |---------+                 door>                               
  |                               >
  |                               |
  |---------+                     |
  | Shelves |                     |
  |---------+            +----+   |
  | Chest                |Desk|   |
  |                      |Lamp|   |
  |---------+            |Desk|   |
  | Shelves |            +----+   |
  |---------+                     |
  |                               |
  |                               |
  +--------------door-------------+
      """;
    case RoomType.throneRoom : return """ 
  +----------------^^^----------------+
  | Banners                           |
  |                                   |
  |              Carpet               |
  |                                   |
  |                              Guard>
  |                            Guard  >
  |                              Guard>
  |                                   |
  |                           Banners |
  | Carpet        Throne              |
  +----------------vvv----------------+
      """;
    default : return "banana";
  }
}