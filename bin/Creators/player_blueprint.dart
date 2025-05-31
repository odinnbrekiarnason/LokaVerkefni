import '../Functions/function_exporter.dart';

Player createPLayer(Player player) {
  print(
    "Hello you are about to create your character what would you like to name him/her",
  );
  player.playerName = stdin.readLineSync().toString();
  player.playerName = playerNameFixed(player.playerName);
  List<Weapon> weapon = [Weapon(name: "Dagger", damage: 8, description: "")];
  player.weaponInHand = weapon;
  player.position = RoomType.startingPoint;
  player.playerDamage = player.playerDamage + player.weaponInHand[0].damage;

  bool correctName = true;
  while (correctName == true) {
    if (player.playerName.toLowerCase().contains("fuck") ||
        player.playerName.toLowerCase().contains("bitch") ||
        player.playerName.toLowerCase().contains("niga") ||
        player.playerName.toLowerCase().contains("faggot")) {
      player.playerName = "Dum Dum";
      print("You cannot name your characted that!!");
      print("Just for that you now do 2 less damage than you would normally");
      print(
        "PS. If you keep writing banned words you will continue to lose damage",
      );
      player.playerDamage = player.playerDamage - 2;
      continue;
    } else if(player.playerName.isNotEmpty) {
      print(
        "Your Name: ${player.playerName}, are you happy with it?\nType yes or no"
      );
      String yesOrNo = stdin.readLineSync().toString().toLowerCase();
      switch (yesOrNo) {
        case "yes" || "ye" || "y" || "ja":
          player.playerName = playerNameFixed(player.playerName);
          correctName = false;
          break;
        case "no" || "na" || "n" || "nei":
          print("Please type in the name you would want for your character");
          String input = stdin.readLineSync().toString();
          player.playerName = playerNameFixed(input);
          continue;
      }
    }
  }
  print("This is your character!");
  getPlayerInfo(player);
  return player;
}
