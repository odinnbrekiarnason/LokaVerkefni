import 'dart:io';
import 'items.dart';
import 'fighting.dart';

void selection(){
  print("""You have encountered a monster what will you choose to do?
           Please type 1, 2 or 3 to select option""");
  print("1. Backpack\n2. Fight\n3. Flee");

  String input = stdin.readLineSync().toString();

  switch(input){
    case "1":
      print("You have opened your backpack");
      Items().openBackPack();
    case "2":
      print("You choose to fight!");
      attack();
    case "3":
      print("You chose to flee!");
  }
}
void main(){
  selection();
}