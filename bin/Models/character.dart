import '../Functions.dart';


class Player extends Items {
  int currentPlayerHealth = 120;
  final int playerMaxHealth = 120;
  int playerDamage = 10;
  RoomType position;
  List<Weapon> weaponInHand = [Weapon(name: "Dagger", damage: 8, description: "A tiny knife, no reach and terrible damage")];
  String playerName = "";
  bool? debuffs = false;
  bool? isDead = false;
  List<Item> backpack = [
    Healing(name: "Bandage", description: "Heals 10 health", healing: 10),
  ];
  List<Key> keyItems = [
    Key(name: "Key", description:"A shiny key", id: 1),
  ];

  Player({required this.playerName, required this.position});

  void openBackPack() {
    print("Your backpack contains:");
    for (Item item in backpack) {
      print("|${item.name}|");
    }
  }

   dynamic getPos(Player player) {
    return position;
  }

    void getPlayerInfo(Player player) {
      List info = [
        "Max health: ${player.playerMaxHealth}",
        "Current health: ${player.currentPlayerHealth}",
        "Damage: ${player.playerDamage}",
        "Your weapon: ",
      ];
      for(String item in info) {
        print(item);
      }
      returnItemName(player.weaponInHand);
    }

    bool gameOver() {
      if (currentPlayerHealth <= 0) {
        print("Your health reaches 0 and you collapse!");
        //gera stórt game over sign vv
        print(""" 
      
      """);
        isDead = true;
      } else {
        isDead = false;
      }
      return isDead!;
    }

  /*void movePlayer(Player player, RoomType room) {
    List armory = [
      ["+----------------door---------------+"],
      ["| Crate           p           Armor |"],
      ["|                             Rack  |"],
      ["|              Monster              |"],
      ["| Weapon                            >"],
      ["| Rack                          door>"],
      ["|                                   >"],
      ["|                                   |"],
      ["|                                   |"],
      ["| Barrel                      Crate |"],
      ["+----------------door---------------+"]
    ];
  }*/
  }
