import 'Functions/function_exporter.dart';

void playGame() {
  List<String> gamer = gameFace.split("\n");
  int row1 = returnRowLength(gameFace);
  for(int i = 0; i < row1; i++) {
    print(gamer[i]);
    sleep(Duration(milliseconds: 100));
  }

  List<String> intro = introduction.split("\n");
  int row = returnRowLength(introduction);
  for(int i = 0; i < row; i++) {
    print(intro[i]);
    sleep(Duration(milliseconds: 570));
  }
  Player player = Player(playerName: "", position: RoomType.startingPoint);
  createPLayer(player);
  bool firstInput = false;

  bool aliveOrNot = player.gameOver();
  while(aliveOrNot == false) {

    while(firstInput == false) {
      beforeFirstInput(player.position);
      firstInput = true;
    }
    String input = stdin.readLineSync().toString().toLowerCase();
    if(input.contains("help")) {
      print("You have called for me");
      print("If you are stuck or cant get somewhere in a room\nType in 'up-down-left-right.1-5' that will move you up by your choice of spaces up to 5\nExample: 'up.1'\n");
      print("PS. you need to type in the direction exactly, not d.3 it needs to be down.3");
      print("If there is an error then to bad so sad cant really help :|");
    }
      print("1. Backpack\n2. Move player\n3. Check player info\nPlease type 1, 2 or 3 to select option");
      selection(player, player.position, input);
  }
}
