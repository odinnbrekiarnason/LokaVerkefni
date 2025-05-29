import 'dart:io';

import '../Functions.dart';


class Player extends Items {
  final int playerMaxHealth = 120;
  int currentPlayerHealth = 120;
  double playerDamage = 15;
  RoomType position;
  List<Weapon> weaponInHand = [Weapon(name: "Dagger", damage: 8, description: "A tiny knife, no reach and terrible damage")];
  String playerName = "";
  int rowPos = 0;
  int colPos = 0;
  bool? debuffs = false;
  bool? isDead = false;
  List<Item> backpack = [
    Healing(name: "Bandage", description: "Heals 10 health", healing: 10),
  ];
  List<Key> keyItems = [
    Key(name: "Key", description:"A shiny key", id: 1),
  ];
  List<RoomType> roomHistory;

  Player({required this.playerName, required this.position, this.roomHistory = const []});

  void openBackPack() {
    print("Your backpack contains:");
    for (Item item in backpack) {
      print("|${item.name}|");
    }
    print("Would you like to use or swap items?");
    String input = stdin.readLineSync().toString().toLowerCase();
    switch(input) {
      case "yes" || "ye" || "y" || "j" || "ja" :


    }
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
