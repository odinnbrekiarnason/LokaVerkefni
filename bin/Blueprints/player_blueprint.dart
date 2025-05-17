import '../Models/character.dart';
import '../Functions.dart';
import 'dart:io';

Player createPLayer(Player player) {
  print("Hello you are about to create your character what would you like to name him/her");
  player.playerName = stdin.readLineSync().toString();
  player.backpack.add(Items().weapons[4]);

  bool correctName = true;
  while(correctName == true) {

    print("${player.playerName} this is your name are you happy with it?\nType yes or no");

    String yesOrNo = stdin.readLineSync().toString().toLowerCase();
    switch (yesOrNo) {
      case "yes":
        correctName = false;
        break;
      case "no":
        print("Please type in the name you would want for your character");
        player.playerName = stdin.readLineSync().toString();
        continue;
    }
  }
  print("This is your character!");
  print(player.getPlayerInfo(player));
  return player;
}

