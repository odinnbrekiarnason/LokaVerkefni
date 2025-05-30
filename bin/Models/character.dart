import '../Functions/function_exporter.dart';

class Player extends Items {
  final int playerMaxHealth = 120;
  int currentPlayerHealth = 120;
  int coin = 0;
  RoomType position;
  List<Weapon> weaponInHand = [Weapon(name: "Dagger", damage: 8, description: "A tiny knife, no reach and terrible damage")];
  double playerDamage = 15;
  String playerName = "";
  int rowPos = 0;
  int colPos = 0;
  List<String> debuffNames;
  bool? debuffs = false;
  bool? isDead = false;
  List<Item> backpack = [
    Healing(name: "Bandage", description: "Heals 10 health", healing: 10),
  ];
  List<Key> keyItems = [
  ];


  Player({required this.playerName, required this.position, this.debuffNames = const []});

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
