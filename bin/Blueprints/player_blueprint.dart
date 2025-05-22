import '../Models/character.dart';
import '../Functions.dart';
import 'dart:io';

Player createPLayer(Player player) {
  print("Hello you are about to create your character what would you like to name him/her");
  player.playerName = stdin.readLineSync().toString();
  List<Weapon> weapon = [Weapon(name: "Dagger", damage: 8, description: "")];
  player.weaponInHand = weapon;
  player.position = RoomType.startingPoint;

  bool correctName = true;
  while(correctName == true) {
    print("${player.playerName} this is your name are you happy with it?\nType yes or no");

    String yesOrNo = stdin.readLineSync().toString().toLowerCase();
    switch (yesOrNo) {
      case "yes" || "ye" || "y" ||"ja":
        correctName = false;
        break;
      case "no" || "na" || "n" || "nei":
        print("Please type in the name you would want for your character");
        player.playerName = stdin.readLineSync().toString();
        continue;
    }
  }
  print("This is your character!");
  player.getPlayerInfo(player);
  return player;
}

