import '../Player/character.dart';
import 'dart:io';

void createPLayer(){
  print("Hello you are about to name your character what would you like to name him/her");
  String playerName = stdin.readLineSync().toString();
  Player player = Player(playerName);

  bool correctName = true;
  while(correctName == true) {

    print("$playerName this is your name are you happy with it?\nType yes or no");

    String yesOrNo = stdin.readLineSync().toString().toLowerCase();
    switch (yesOrNo) {
      case "yes":
        correctName = false;
        break;
      case "no":
        print("Please type in the name you would want for your character");
        playerName = stdin.readLineSync().toString();
        continue;
    }
  }
}