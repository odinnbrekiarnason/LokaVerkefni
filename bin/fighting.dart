import 'monsters.dart';
import 'character.dart';
import 'dart:io';

void attack() {
  print(
    "What attack would you like to do?\n"
    "1.Normal attack 2.Heavy attack\n"
    "Note you have to type a number to select attack!");

  String input = stdin.readLineSync().toString();

  switch(input) {
    case "1":
      if(selectMonster().contains("Minotaur")){
      print("You attack the ${selectMonster()}");
        Minotaur().health = Player().playerDamage - Minotaur().health ;
        print("You did ${Player().playerDamage} damage!");
      }
      else if(selectMonster().contains("Goblin")){
        print("You attack the ${selectMonster()}");
        Goblin().health = Player().playerDamage - Goblin().health;
        print("You did ${Player().playerDamage} damage!");
      }
      else if(selectMonster().contains("Wolf")){
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

