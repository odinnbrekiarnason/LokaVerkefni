import '../Functions.dart';


class Player extends Items {
  int currentPlayerHealth = 120;
  final int playerMaxHealth = 120;
  int playerDamage = 10;
  String weaponInHand = "Dagger";
  String playerName = "";
  bool? debuffs = false;
  bool? isDead = false;
  List<Item> backpack = [
    Key(name: "Key", description:"A shiny key"),
    Item(name: "Bandage", description: "Heals 10 health"),
  ];

  Player({required this.playerName});

  void movePlayer(Player player){
    
  }

  void openBackPack() {
    print("Your backpack contains:");
    for (Item item in backpack) {
      print("|${item.name}|");
    }
  }

    List getPlayerInfo() {
      List info = [
        "Max health", playerMaxHealth,
        "Current health:", currentPlayerHealth,
        "Damage:", playerDamage,
        "Your weapon:", weaponInHand,
      ];

      return info;
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
  }
