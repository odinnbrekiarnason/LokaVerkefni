String winGame = """
              _____  _____  __  _  _____  _____  _____  _____  _   _  __     _____  _____  _____  _____  __  _  _____ 
             |   __||     ||  \\| ||   __|| __  ||  _  ||_   _|| | | ||  |   |  _  ||_   _||_   _||     ||  \\| ||   __|
             |  |__ |  |  || |\\|  |  |  ||    -||     |  | |  | |_| ||  |__ |     |  | |   _| |_||  |  || |\\| ||__   |
             |_____||_____||_| \\_||_____||__|__||__|__|  |_|  |_____||_____||__|__|  |_|  |_____||_____||_| \\_||_____|                                                                                                                           
                                         __ __  _____  _____    _ _ _  _____  __  _                                        
                                        |  |  ||     ||  |  |  | | | ||     ||  \\| |                                       
                                        |_   _||  |  ||  |  |  | | | ||  |  || |\\| |                                      
                                          |_|  |_____||_____|  |_____||_____||_| \\_|                                       
                                                                                     __  __                               
                                  _____  __ __  _____    _____  _____  _____  _____ |  ||  |                              
                                 |_   _|| |_| ||   __|  |   __||  _  ||     ||   __||  ||  |                              
                                   | |  |  _  ||   __|  |  |  ||     || | | ||   __||__||__|                              
                                   |_|  |_| |_||_____|  |_____||__|__||_|_|_||_____||__||__|                              
""";


String gameFace = """                                                                                                                                                                                          
                                   _ _ _  _____  __     _____  _____  _____  _____                                   
                                  | | | ||   __||  |   |     ||     ||     ||   __|                                  
                                  | | | ||   __||  |__ |   --||  |  || | | ||   __|                                  
                                  |_____||_____||_____||_____||_____||_|_|_||_____|                                  
                                                     _____  _____                                                    
                                                    |_   _||     |                                                   
                                                      | |  |  |  |                                                   
                                                      |_|  |_____|                                                   
                             _____  _____  _____  _____  __     _____    _____  _____  _____                         
                            |   __||_   _||     ||  _  ||  |   |   __|  | __  ||  _  ||   __|                        
                            |__   | _| |_ | | | ||   __||  |__ |   __|  |    -||   __||  |  |                        
                            |_____||_____||_|_|_||__|   |_____||_____|  |__|__||__|   |_____|                               
           _____  _____  _____  _____  _____  __  _  _____  __       _____  ____   _____  _____  _____  _____  __  _ 
          |_   _||   __|| __  ||     ||_   _||  \\| ||  _  ||  |     |   __||    \\ |_   _||_   _||_   _||     ||  \\| |
            | |  |   __||    -|| | | | _| |_ | |\\| ||     ||  |__   |   __||  |  | _| |_   | |   _| |_ |  |  || |\\| |
            |_|  |_____||__|__||_|_|_||_____||_| \\_||__|__||_____|  |_____||____/ |_____|  |_|  |_____||_____||_| \\_|
""";

String introduction = """
---------------------------------------------------------Rules---------------------------------------------------------
                                                       Hi there!
                                         The rules of this game are really simple,
                                             You move by typing in keyWords : 
                                                     up,  up.1-6,
                                                    down,  down.1-6,
                                                    left,  left.1-6,
                                                   right,  right.1-6
                       In each room there will be a key and on some there will be a Monster and a Chest 
                                                       Chest = C,
                                                        Key = K, 
                                                      Monster = M,
                     You will need to walk onto/near these letters and once you do something will happen! 
                               You will need to get most of the keys to reach the boss room,
        Also anytime you enter a new room you will be in the middle of the room or at one of the doors depending on the room,
                          You can stop and check your items or stats anytime by typing in "stop"
                    One more thing if you get debuffed you cannot remove it unless you drink your milk!
  
              PS.If you get stuck or cannot reach desired destination type "help" and i will be there to help you! 
                                                    Anyways that's all.                               
                                     _________  ____  ___    __   __  _________ __  
                                    / ___/ __ \\/ __ \\/ _ \\  / /  / / / / ___/ //_/  
                                   / (_ / /_/ / /_/ / // / / /__/ /_/ / /__/ ,<     
                                   \\___/\\____/\\____/____/ /____/\\____/\\___/_/|_|    
                                    __ _____ _   ______  ______  ___  __  ____    
                                   / // / _ | | / / __/ / __/ / / / |/ / / / /    
                                  / _  / /| | |/ / _/  / _// /_/ /    / /_/_/     
                                 /_//_/_/ |_|___/___/ /_/  \\____/_/|_/ (_|_)                                                                                                                                                                                                                                                                                                                                                                         
-------------------------------------------------------GameStart-------------------------------------------------------
""";

String startingPoint = """
+----------------^^^----------------+
|                                   |
|                                   |
|                 K                 |
|                                   >
|                 P                 >
|                                   >
|     M                             |
|   C                               |
|                                   |
|                                   |
+----------------VVV----------------+
""";

 String armory = """
+----------------^^^----------------+
| crate           M           Armor |
|                              Rack |
|     C                             |
|                                   |
| Weapon                            >
| Rack            P                 > 
|                                   >
|                                   |
|                               K   |
|                             crate |
| Barrel                      crate |
+----------------VVV----------------+
""";

 String diningRoom = """
+-----------------------------------+
|  Table                          C |
|                                   |
|      chair |--------| chair       |
|            |        |             |
|      chair |  Big   | chair       >
|            |  Dish  |             >
|      chair |        | chair       >
|            |        |             |
|      chair |________| chair       |
|                                   |
|   K                               |
| crate           P          chairs |
+----------------VVV----------------+
""";

 String emptyChamber = """
+-----------------------------------+
| Dust K                     crate  |
| pile                              |
|                Barrel             |
|                                   |
<  P                        cobwebs |
<           Barrel                  |
|                                   |
|                     M             |
| Dust                              |
| pile                        Junk  | 
+-----------------------------------+
""";

 String kitchen = """
+-----------------------------------+
| Oven |         K  | *     * |     |
| Oven |            +---------+     |
|------+                            |
<                                   >
|------+           P                >
|Fridge|                            >
|------+                            |
|    C            +-----------------|
| cabinet         |  pans    pots   |
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
|---------+       M             |
|                               |
|               P               |
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
+--------------VVV--------------+
""";

 String throneRoom = """
+-----------------------------------+
| Banners    +_________+    Banners |
|            |___   ___|            |
|    C        |_______|             |
|                                   |
|                 M                 |
|                                   |
|                                   |
|                                   |
| carpet                            |
|                 P                 |
+----------------VVV----------------+
""";

 String bossRoom = """
+----------------^^^------------------+
| Torch                       Weapon  |
|                 P            Rack   |
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
|                  P                  |
|                                     |
<                                     |
< Rug                            K    |
<                               Bed   |
|                                     |
|                                     |
|                            Wardrobe |
| Rug   C                     mirror  |
+-----------------VVV-----------------+
""";

 String treasureRoom = """
+-------------------------------------+
| C                M          Statue  |
|                                     |
|                                     |
<   Gold pile                         |
<                  P                  |
<                                     |
|                                     |
|   K                       Treasure  |
| carpet                      Altar   |
+-----------------VVV-----------------+
 """;

 String storageRoom = """
+-------------------------------------+
| crates                      Barrels |
|                  M             K    |
|                                     |
< Shelves                             |
<                  P            crates|
<                                     |
|     C                               |
|                            Barrels  |
| Boxes                       Rack    |
+-----------------VVV-----------------+
 """;

 String hallway = """
+----------------------------^^^------------------------------+
| Torch                                               painting|
<              M                                        K     >
<                             P                               >
<                                                             >
|                                                             |
+---------------------------------------------VVV-------------+
 """;




/*String currentRoomMap(RoomType type, Player player) {
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
}*/



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