import '../Enemies/monsters.dart';

class Player {
  int playerHealth = 120;
  int playerDamage = 15;
  String playerWeapon = "Dagger";
  List backPack = ["Health Potion"];
  String playerName = "";
  bool debuffs = false;

  Player(this.playerName);

}