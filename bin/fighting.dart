import 'monsters.dart';
import 'character.dart';
import 'dart:io';
import 'dart:math';

void attack() {
  print(
    "What attack would you like to do?\n"
    "1.Normal attack 2.Heavy attack\n"
    "Note you have to type a number to select attack!");

  String input = stdin.readLineSync().toString();

  switch(input) {
    case "1":
      if(selectMonster() == "Minotaur"){
      print("You attack the ${selectMonster()}");
        Minotaur().health = Player().playerDamage - Minotaur().health ;
        print("You did ${Player().playerDamage} damage!");
      }
      else if(selectMonster() == "Goblin"){
        print("You attack the ${selectMonster()}");
        Goblin().health = Player().playerDamage - Goblin().health;
        print("You did ${Player().playerDamage} damage!");
      }
      else if(selectMonster() == "Wolf"){
        print("You attack the ${selectMonster()}");
        Wolf().health = Player().playerDamage - Wolf().health ;
        print("You did ${Player().playerDamage} damage!");
      }

    case "2":
      if(selectMonster().contains("Minotaur")){
        print("You charge the ${selectMonster()} with rage in your eyes!");
        Minotaur().health = Player().playerDamage + 5 - Minotaur().health ;
        print("You did ${Player().playerDamage + 5} much damage!");
      }
      else if(selectMonster().contains("Goblin")){
        print("You charge the ${selectMonster()} with rage in your eyes!");
        Goblin().health = Player().playerDamage + 5 - Goblin().health ;
        print("You did ${Player().playerDamage + 5} much damage!");
      }
      else if(selectMonster().contains("Wolf")){
        print("You charge the ${selectMonster()} with rage in your eyes!");
        Wolf().health = Player().playerDamage + 5 - Wolf().health ;
        print("You did ${Player().playerDamage + 5} much damage!");
      }
  }
}
class selectMonsters{
  List<String> monster = ["Minotaur","Goblin","Wolf"];
  Random random = new Random();
}


String selectMonster(){
  List<String> monster = ["Minotaur","Goblin","Wolf"];
  Random random = new Random();
  int select = random.nextInt(2);
  String selectedMonster = "";
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


