import '../Functions/function_exporter.dart';

RoomType getPos(Player player) {
  return player.position;
}

int getColPos(Player p, String map) {
  List<String> mapRows = map.split("\n");
  int playerCol = -1;
  for(int i = 0; i < mapRows.length; i++){
    int col = mapRows[i].indexOf("P");
    if(col != -1) {
      playerCol = col;
      break;
    }
  }
  p.colPos = playerCol;
  return p.colPos;
}

int getRowPos(Player p, String map) {
  List<String> mapRows = map.split("\n");
  int playerRow = -1;
  for(int i = 0; i < mapRows.length; i++){
    int col = mapRows[i].indexOf("P");
    if(col != -1) {
      playerRow = i;
      break;
    }
  }
  p.rowPos = playerRow;
  return p.rowPos;
}

void getPlayerInfo(Player player) {
  List info = [
    "Your Name: ${player.playerName}",
    "Max health: ${player.playerMaxHealth}",
    "Current health: ${player.currentPlayerHealth}",
    "Damage: ${player.playerDamage}",
    "Your weapon: ",
  ];
  for(String item in info) {
    print(item);
    sleep(Duration(milliseconds: 150));
  }
  returnItemName(player.weaponInHand);
  print(" ");
}

void openBackPack(Player player) {
  print("Your backpack contains:");
  for (Item item in player.backpack) {
    print("|${item.name}|");
  }
  print("Would you like to use or swap items?");
  print("Type Yes/No");
  String input = stdin.readLineSync().toString().toLowerCase();
  switch(input) {
    case "yes" || "ye" || "y" || "j" || "ja" :
      useItemInBackPack(player);
      break;
    default :
      print("Chose not to use item");
      break;
  }
}

/*
void getKeyInfo(Player p){
  for(int i = 0; i < p.keyItems.length; i++) {
    return p.keyItems[i].id;
  }
}*/
