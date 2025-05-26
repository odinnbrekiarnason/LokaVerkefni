import '../Functions.dart';

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
    "Max health: ${player.playerMaxHealth}",
    "Current health: ${player.currentPlayerHealth}",
    "Damage: ${player.playerDamage}",
    "Your weapon: ",
  ];
  for(String item in info) {
    print(item);
  }
  returnItemName(player.weaponInHand);
}

/*
void getKeyInfo(Player p){
  for(int i = 0; i < p.keyItems.length; i++) {
    return p.keyItems[i].id;
  }
}*/
