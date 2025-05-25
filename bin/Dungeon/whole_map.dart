import '../Functions.dart';


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
  String tempString = "";
  switch(type) {
    case RoomType.startingPoint :
      print("""Hello, ${player.playerName} welcome to the dungeon!
This is your starting point and you will face many challenges here.
you will need to find a way out of the dungeon and defeat the monsters.
there are many rooms in the dungeon and you will need to find the key to open the door for each one!.
there will most likely be a monster in each room, so be careful!
also there will be a chest in each room, so be sure to open it!
if you need any help just type "help" and i will be there to help you!""");
      tempString = """ 
+----------------↕↕↕----------------+
|                                   |
|                                   |
|                 P                 |
|                                   >
|                                   >
|                                   >
|                                   |
|                                   |
|                                   |
+-----------------------------------+
        """;
    return tempString;
    case RoomType.armory :
      tempString =  """
  +----------------↕↕↕----------------+
  | Crate           P           Armor |
  |                              Rack |
  |              Monster              |
  |                                   |
  | Weapon                            >
  | Rack                          door> 
  |                                   >
  |                                   |
  |                                   |
  |  chest                      Crate |
  | Barrel                      Crate |
  +----------------↕↕↕----------------+
        """;
      return tempString;

    case RoomType.diningRoom :
      tempString = """ 
  +----------------↕↕↕----------------+
  |  Table          P                 |
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
  +----------------↕↕↕----------------+
        """;
      return tempString;

    case RoomType.emptyChamber :
      tempString = """ 
  +-----------------------------------+
  | Dust                       Crate  |
  | Pile                              |
  |                Barrel             |
  |                                   |
  <    P                      Cobwebs |
  <           Barrel                  |
  |                                   |
  |                     Monster       |
  | Dust                              |
  | Pile                        Junk  | 
  +-----------------------------------+
        """;
    case RoomType.kitchen :
      tempString = """ 
  +-----------------------------------+
  | Oven |            | *     * |     |
  | Oven |            +---------+     |
  |------+                            |
  |                                   >
  |------+                  P     door>
  |Fridge|                            >
  |------+                            |
  |                 +-----------------|
  | Cabinet         |  Pans    Pots   |
  +-----------------------------------+
        """;
      return tempString;

    case RoomType.library :
      tempString = """ 
  +-------------------------------+
  | Shelves |              Book   |
  |---------+              Stack  |
  |  Book                         |
  |                               |
  |---------+                     |
  | Shelves |                     >
  |---------+             P   door>                               
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
      return tempString;

    case RoomType.throneRoom :
      tempString = """ 
  +----------------^^^----------------+
  | Banners         P         Banners |
  |                                   |
  |                                   |
  |                                   |
  |                              Guard>
  |                            Guard  >
  |                              Guard>
  |              |______|             |
  | Carpet      | Throne |            |
  |             +________+            |
  +-----------------------------------+
      """;
      return tempString;
    default : return "banana";
  }
  return tempString;
}

/*+-----------------^^^-----------------+
| Stairs                    Railing   |
|                                     |
|                                     |
|                                     |
| Stairs                              >
|                              Stairs >
|                                     >
|                                     |
|                            Railing  |
| Torch                       Stairs  |
+----------------vvv------------------+*/

/*+----------------^^^----------------+
| Bed                       Wardrobe  |
|                                     |
|             Mirror                  |
|                                     |
| Rug                                 >
|                               Bed   >
|                                     >
|                                     |
|                            Wardrobe |
| Rug                         Mirror  |
+----------------vvv------------------+*/