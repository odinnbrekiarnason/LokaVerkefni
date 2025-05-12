import '../Enemies/monsters.dart';
import '../Functions.dart';

class Player extends Items {
  int currentPlayerHealth = 120;
  int playerMaxHealth = 120;
  int playerDamage = 15;
  String weaponInHand = "Dagger";
  String playerName = "";
  bool? debuffs = false;
  bool? isDead = false;

  //bookMark
  List getPlayerInfo(playerName) {
    List info = [
      playerMaxHealth = 120,
      currentPlayerHealth,
      playerDamage = 15,
      weaponInHand,
    ];

    return info;
  }

  void gameOver(){
    if(currentPlayerHealth <= 0){
      print("Your health reaches 0 and you collapse!");
      //gera stórt game over sign vv
      print(""" 
      
      """);
      isDead = true;
    }
  }
}