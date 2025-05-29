import 'dart:math';
import '../Functions.dart';

String selectMonster() {
  String selectedMonster = "";
  List<String> monster = ["Minotaur","Goblin","Wolf"];
  Random random = Random();
  int select = random.nextInt(monster.length);
  selectedMonster = monster[select];

  if(selectedMonster != "") {
    switch (selectedMonster) {
      case "Minotaur":
        print("You are approached by something massive from the shadows!\nIts a Minotaur!");
      case "Goblin":
        print("You see a crawler in the dark!\nIts a Goblin!");
      case "Wolf":
        print("You see something sprinting full speed at you!\nIts a Wolf!");
      default: "Error";
    }
  }
  return selectedMonster;
}


Monster createMonster() {
  Monster monster = Minotaur();
   final String selectedMonster = selectMonster();
   if(selectedMonster.contains("Minotaur")) {
     Minotaur minotaur = Minotaur();
     monster = minotaur;
     return monster;
   }
    else if(selectedMonster.contains("Goblin")) {
      Goblin goblin = Goblin();
      monster = goblin;
      return monster;
    }
    else if(selectedMonster.contains("Wolf")) {
      Wolf wolf = Wolf();
      monster = wolf;
      return monster;
    }
    else {
      print("Error");
    }
    return monster;
}