import '../Enemies/monsters.dart';
import '../Functions.dart';

class Player extends Items {
  int playerHealth = 120;
  int playerDamage = 15;
  String playerWeapon = "Dagger";
  String playerName = "";
  bool debuffs = false;
  bool isDead = false;

  Player(this.playerName);

  void gameOver(){
    if(playerHealth <= 0){
      print("Your health reaches 0 and you collapse!");
      //gera stórt game over sign vv
      print(""" 
      
      """);
    }
  }
}