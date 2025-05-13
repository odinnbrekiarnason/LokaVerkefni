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


  List getPlayerInfo() {
    List info = [
      "Max health", playerMaxHealth = 120,
      "Current health:", currentPlayerHealth,
      "Damage:", playerDamage = 15,
      "Your weapon:", weaponInHand,
    ];

    return info;
  }

  bool gameOver(){
    if(currentPlayerHealth <= 0){
      print("Your health reaches 0 and you collapse!");
      //gera stórt game over sign vv
      print(""" 
      
      """);
      isDead = true;
    } else {
      isDead = false;
    }
      return isDead!;
    }
  }