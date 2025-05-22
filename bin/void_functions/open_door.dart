import "../Functions.dart";
import "dart:io";

bool onOpen(Player player) {
  RoomType type = player.getPos(player);
  bool canUOpen = false;
  if (player.keyItems[0].isKey == true) {
    print("Looks like you have the key for this door!\nWould you like to go to the next room?\nType yes or no");
    String answer = stdin.readLineSync().toString().toLowerCase().trim();
    canUOpen = true;
    switch(answer) {
      case "yes" || "y" || "ye" || "ja" :
        player.keyItems.removeAt(0);
        print("you open the door and walk into the next room\nThe key evaporates!");
        movePlayer(player, type);

      case "no" || "n" || "na" || "nei" :
        print("Remember you can open the door at anytime by typing in open door");
        return canUOpen = false;
    }
  } else {
    print("No key in your inventory");
  }
  return canUOpen;
}