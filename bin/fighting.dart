import 'monsters.dart';
import 'character.dart';
import 'dart:io';
import 'dart:math';

void attack() {
  print(
    "What attack would you like to do?\n"
    "1.Normal attack\n2.Heavy attack\n"
    "Note you have to type a number to select attack!");

  String attackInput = stdin.readLineSync().toString();
  String selectedMonster = selectMonster();

  switch(attackInput) {
    case "1":
      if(selectedMonster == "Minotaur"){
      print("You attack the $selectedMonster");
        Minotaur().health = Player().playerDamage - Minotaur().health ;
        print("You did ${Player().playerDamage} damage!");
      }
      else if(selectedMonster == "Goblin"){
        print("You attack the $selectedMonster");
        Goblin().health = Player().playerDamage - Goblin().health;
        print("You did ${Player().playerDamage} damage!");
      }
      else if(selectedMonster == "Wolf"){
        print("You attack the $selectedMonster");
        Wolf().health = Player().playerDamage - Wolf().health ;
        print("You did ${Player().playerDamage} damage!");
      }

    case "2":
      if(selectedMonster.contains("Minotaur")){
        print("You charge the $selectedMonster with rage in your eyes!");
        Minotaur().health = Player().playerDamage + 5 - Minotaur().health ;
        print("You did ${Player().playerDamage + 5} much damage!");
      }
      else if(selectedMonster.contains("Goblin")){
        print("You charge the $selectedMonster with rage in your eyes!");
        Goblin().health = Player().playerDamage + 5 - Goblin().health ;
        print("You did ${Player().playerDamage + 5} much damage!");
      }
      else if(selectedMonster.contains("Wolf")){
        print("You charge the $selectedMonster with rage in your eyes!");
        Wolf().health = Player().playerDamage + 5 - Wolf().health ;
        print("You did ${Player().playerDamage + 5} much damage!");
      }
  }
}

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

/*class SelectedMonsters{
  List<String> monster = ["Minotaur","Goblin","Wolf"];
  Random random = new Random();
  String selectedMonster = "";

  String selectMonster(){
    int select = random.nextInt(2);
    selectedMonster = monster[select];
    print(select);
    print(selectedMonster + "aaa");

    if(selectedMonster == "Minotaur") {
      print("You are approached by something massive from the shadows!\nIts a Minotaur!");
    }

    else if(selectedMonster == "Goblin") {
      print("You see a crawler in the dark!\nIts a Goblin");
    }

    else if(selectedMonster == "Wolf") {
      print("You see something sprinting full speed at you!\nIts a Wolf");
    }

    return selectedMonster;
  }
}*/




