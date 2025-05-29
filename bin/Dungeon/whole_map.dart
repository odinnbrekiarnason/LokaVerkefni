import '../Functions.dart';

String startingPoint = """
+----------------^^^----------------+
|                                   |
|                                   |
|                 P                 |
|                                   >
|                                   >
|                                   >
|                                   |
|                                   |
|                                   |
+----------------vvv----------------+
""";

 String armory = """
+----------------^^^----------------+
| Crate           P           Armor |
|                              Rack |
|                 M                 |
|                                   |
| Weapon          C                 >
| Rack                              > 
|                                   >
|                                   |
|                                   |
|                             Crate |
| Barrel                      Crate |
+----------------vvv----------------+
""";

 String diningRoom = """
+-----------------------------------+
|  Table                          C |
|                                   |
|      Chair |--------| Chair       |
|            |        |             |
|      Chair |  Big   | Chair       >
|            |  Dish  |             >
| door Chair |        | Chair       >
|            |        |             |
|      Chair |________| Chair       |
|                                   |
|                                   |
| Crate           P          Chairs |
+----------------vvv----------------+
""";

 String emptyChamber = """
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

 String kitchen = """
+-----------------------------------+
| Oven |            | *     * |     |
| Oven |            +---------+     |
|------+                            |
<  P                                |
|------+                            |
|Fridge|                            |
|------+                            |
|                 +-----------------|
| Cabinet         |  Pans    Pots   |
+-----------------------------------+
""";

 String library = """
+--------------^^^--------------+
| Shelves |              Book   |
|---------+              Stack  |
|  Book                         |
|                               |
|---------+                     |
| Shelves |                     |
|---------+       M     P       |
|                               |
|                               |
|---------+                     |
| Shelves |                     |
|---------+            +----+   |
| C                    |Desk|   |
|                      |Lamp|   |
|---------+            |Desk|   |
| Shelves |            +----+   |
|---------+                     |
|                               |
|                               |
+--------------vvv--------------+
""";

 String throneRoom = """
+----------------^^^----------------+
| Banners         P         Banners |
|                                   |
|                                   |
|                                   |
|                              M    >
|                              M    >
|                              M    >
|              |______|             |
| Carpet      | Throne |            |
|             +________+            |
+-----------------------------------+
""";

 String bossRoom = """
+----------------^^^------------------+
| Torch                       Weapon  |
|                              Rack   |
|                                     |
|                                     |
|                 B                   |
|                                     |
|                                     |
|                                     |
|                            Railing  |
| Torch                       Stairs  |
+-------------------------------------+
""";

 String bedroom = """
+-----------------^^^-----------------+
| Bed                       Wardrobe  |
|                                     |
|                                     |
<                                     |
< Rug                                 |
<                               Bed   |
|                                     |
|                                     |
|                            Wardrobe |
| Rug                         Mirror  |
+-----------------vvv-----------------+
""";

 String treasureRoom = """
+-----------------^^^-----------------+
| C                           Statue  |
|                                     |
|                                     |
| Gold Pile                           |
|                  M            C     |
|                                     |
|                                     |
|                           Treasure  |
| Carpet                      Altar   |
+-----------------vvv-----------------+
 """;

 String storageRoom = """
+-------------------------------------+
| Crates                      Barrels |
|                  M                  |
|                                     |
< Shelves                             |
<                               Crates|
<                                     |
|     C                               |
|                            Barrels  |
| Boxes                       Rack    |
+-----------------vvv-----------------+
 """;

 String hallway = """
+----------------------------^^^------------------------------+
| Torch                                               Painting|
<                                                             >
<                             M                               >
|                                                             |
+-----------------vvv-----------------------------------------+
 """;




String currentRoomMap(RoomType type, Player player) {
  switch (type) {
    case RoomType.startingPoint:
      return startingPoint;
    case RoomType.armory:
      return armory;
    case RoomType.diningRoom:
      return diningRoom;
    case RoomType.kitchen:
      return kitchen;
    case RoomType.storageRoom:
      return storageRoom;
    case RoomType.emptyChamber:
      return emptyChamber;
    case RoomType.library:
      return library;
    case RoomType.throneRoom:
      return throneRoom;
    case RoomType.bossRoom:
      return bossRoom;
    case RoomType.bedroom:
      return bedroom;
    case RoomType.treasureChamber:
      return treasureRoom;
    case RoomType.hallway:
      return hallway;
  }
}



/*void showMap() {
  print("""
 [DiningRoom] ↔ [Kitchen] [TreasureChamber]
     ↕
[>StartingPoint<] ↔ [Storage Room]
     ↕      [ThroneRoom]        ↕
  [Armory] ↔ [Hallway] ↔ [Library]
     ↕             ↕
[EmptyChamber] ↔ [BedRoom]
     ↕
[Boss Room]
  """
);
}*/