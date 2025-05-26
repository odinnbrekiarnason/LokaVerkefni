import "../Functions.dart";
import "dart:io";

bool onOpen(Player player) {
  RoomType type = getPos(player);
  int id = getRoomId(type);
  bool canUOpen = false;

  for(int i = 0; i < player.keyItems.length; i++) {
    if (player.keyItems[i].id == id) {
      print("Looks like you have the key for this door!\nWould you like to go to the next room?\nType yes or no");
      String answer = stdin.readLineSync().toString().toLowerCase().trim();
      canUOpen = true;
      switch (answer) {
        case "yes" || "y" || "ye" || "ja" :
          player.keyItems.removeAt(i);
          print( "you open the door and walk into the next room\nThe key evaporates!");
          movePlayer(player, type);

        case "no" || "n" || "na" || "nei" :
          print(
              "Remember you can open the door at anytime by typing in open door");
          return canUOpen = false;
      }
    } else {
      print("No key in your inventory");
    }
  }
  return canUOpen;
}