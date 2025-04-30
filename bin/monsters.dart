import "dart:math";
import "character.dart";

abstract class Monster {
  int damage = 0;
  int health = 0;
  List<String> attack = [];
  String setAttack = "";

  void attackPlayer(){
  }
  void die(){

  }
}

class Minotaur implements Monster {
  @override
  List<String> attack = [
    "Minotaur swings his axe at you!",
    "Minotaur charges in your direction!",
    "Minotaur hurls a boulder at you!"
  ];
  @override
  String setAttack = "";
  String weapon = "Axe";

  @override
  int damage = 20;

  @override
  int health = 200;

  void selectAttack(){
    Random random = new Random();
    int selectAttackMove = random.nextInt(attack.length);
    setAttack = attack[selectAttackMove];
  }

  @override
  void attackPlayer() {
    Random random = new Random();
    int attackOrSwing = random.nextInt(100);
    selectAttack();
    if(attackOrSwing <= 20){
      print("""
      Minotaur attacks you with an $weapon!"
      \nYou take ${damage + 5} damage
      \nIt has $health health left!"""
      );
    } else if (attackOrSwing >= 21){
      print("$setAttack\nHe does $damage damage!");
    }
  }

  @override
  void die() {
    if(health <= 0){
      print("The Minotaurs health reaches 0 and he slams to the ground!");
    }
  }
}

class Goblin implements Monster{
  @override
  List<String> attack = [
    "Goblin claws at you",
    "Goblin bites you",
  ];
  @override
  String setAttack = "";
  String weapon = "Dagger";

  @override
  int damage = 5;

  @override
  int health = 50;

  @override
  void attackPlayer() {
    Random random = new Random();
    int attackOrSwing = random.nextInt(100);
    selectAttack();
    if(attackOrSwing <= 20){
      print("""
      Goblin attacks you with a $weapon!"
      \nYou take ${damage + 2} damage
      \nIt has $health health left!"""
      );
    } else if (attackOrSwing >= 21){
      print("$setAttack\nHe does $damage damage!");
    }
  }
  void selectAttack(){
    Random random = new Random();
    int selectAttackMove = random.nextInt(attack.length);
    setAttack = attack[selectAttackMove];
  }

  @override
  void die() {
    if(health <= 0){
      print("The Goblins health reaches 0 and he falls on the ground!");
    }
  }
}

class Wolf implements Monster{
  @override
  List<String> attack = [
    "Wolf runs at you and bites you!",
    "Wolf swipes at you", //more attacks?
    "Wolf howls at you"
  ];

  @override
  int damage = 10;

  @override
  int health = 100;

  @override
  String setAttack = "";

  @override
  void attackPlayer() {
      selectAttack();
      if (setAttack.contains("howl")){
        return;
      }else {
        print("$setAttack\nHe does $damage damage!");
      }
  }
  void selectAttack(){
    Random random = new Random();
    int selectAttackMove = random.nextInt(attack.length);
    setAttack = attack[selectAttackMove];
  }

  bool howl(){
    bool isTrue = false;
    while(isTrue = true){
      Player().playerDamage = Player().playerDamage - 3;
    }
    if (setAttack.contains("howl")){
      print("You get effected by his howl\nYour damage is reduced by 3");
      isTrue = true;
    }
    return isTrue;
  }

  @override
  void die() {
    print("The Wolfs health reaches 0 and he howls his last howl!");
  }
}
