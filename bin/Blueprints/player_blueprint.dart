import '../Player/character.dart';
import 'dart:io';

void createPLayer(){
  print("Hello you are about to create your character what would you like to name him/her");
  Player playerOne = Player();
  playerOne.playerName = stdin.readLineSync().toString();

  bool correctName = true;
  while(correctName == true) {

    print("${playerOne.playerName} this is your name are you happy with it?\nType yes or no");

    String yesOrNo = stdin.readLineSync().toString().toLowerCase();
    switch (yesOrNo) {
      case "yes":
        correctName = false;
        break;
      case "no":
        print("Please type in the name you would want for your character");
        playerOne.playerName = stdin.readLineSync().toString();
        continue;
    }
  }
}