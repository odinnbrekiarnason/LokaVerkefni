import '../Functions/function_exporter.dart';

bool checkForIndex(String check, Player player, String map) {
  List<String> split = map.split("\n");
  String dest = split[player.rowPos].length > player.colPos ? split[player.rowPos][player.colPos] : " ";

  if(
  split[player.rowPos + 1][player.colPos] == check ||
  split[player.rowPos - 1][player.colPos] == check ||
  split[player.rowPos][player.colPos + 1] == check ||
  split[player.rowPos][player.colPos - 1] == check ||
  dest.contains(check)
  ) {
    return true;
  } else {
    return false;
  }
}

int getColPosItem(String check, String map) {
  List<String> mapRows = map.split("\n");
  int checkCol = -1;
  for(int i = 0; i < mapRows.length; i++){
    int col = mapRows[i].indexOf(check);
    if(col != -1) {
      checkCol = col;
      break;
    }
  }
  return checkCol;
}

int getRowPosItem(String check, String map) {
  List<String> mapRows = map.split("\n");
  int checkRow = -1;
  for(int i = 0; i < mapRows.length; i++){
    int col = mapRows[i].indexOf(check);
    if(col != -1) {
      checkRow = i;
      break;
    }
  }

  return checkRow;
}