import 'dart:math';
import '../Functions.dart';

String selectMonster() {
  String selectedMonster = "";
  List<String> monster = ["Minotaur","Goblin","Wolf"];
  Random random = new Random();
  int select = random.nextInt(monster.length);
  selectedMonster = monster[select];

  if(selectedMonster != ""){
    switch (selectedMonster){
      case "Minotaur":
        print("You are approached by something massive from the shadows!\nIts a Minotaur!");
      case "Goblin":
        print("You see a crawler in the dark!\nIts a Goblin!");
      case "Wolf":
        print("You see something sprinting full speed at you!\nIts a Wolf!");
      default: "Err";
    }
  }
  return selectedMonster;
}

//búa til class sem eg get gripið í til þess að geta set monsters inni rooms og hafa set monsters i set rooms ofl.

void createMonster(){
   String selectedMonster = selectMonster();
   String setAttack = Minotaur().attackPlayer();
   if(selectedMonster.contains("Minotaur")){
     var minotaur = Minotaur();
   }
}