import 'Functions.dart';
import 'dart:io';

void playGame() {
    print(introduction);

  Player player = Player(playerName: "", position: RoomType.startingPoint);
  createPLayer(player);
  bool aliveOrNot = player.gameOver();
  while(aliveOrNot == false) {
    String input = stdin.readLineSync().toString().toLowerCase();
    if(input.contains("help")) {
      print("You have called for me");
      print("If you are stuck or cant get somewhere in a room\nType in 'up-down-left-right.1-5' that will move you up by your choice of spaces up to 5\nExample: 'up.1'\n");
      print("PS. you need to type in the direction exactly, not d.3 it needs to be down.3");
      print("If there is an error then to bad so sad cant really help :|");
    }
    selection(player, player.position, input);
  }
}