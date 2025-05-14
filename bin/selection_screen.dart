import 'dart:io';
import 'Player/items.dart';
import 'Enemies/fighting.dart';
import 'Functions.dart';

void selection(Player player){
  print("You have encountered a monster what will you choose to do?"
           "Please type 1, 2 or 3 to select option");
  print("1. Fight\n2. Backpack\n3. Flee");

  String selectionInput = stdin.readLineSync().toString();

  switch(selectionInput){
    case "1":
      print("You choose to fight!");
      attackMonster(player);
    case "2":
      print("You have opened your backpack");
      player.openBackPack();
    case "3":
      print("You chose to flee!");
  }
}

