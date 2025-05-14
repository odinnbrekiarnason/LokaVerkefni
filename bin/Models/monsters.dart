import "dart:math";
import "character.dart";

abstract class Monster {
  int damage = 0;
  int health = 0;
  List<String> attack = [];
  String setAttack = "";
  bool? isDead;

  void attackPlayer(Player player) {
  }
  bool checkIfDead() {
    return isDead!;
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

  void selectAttack() {
    Random random = new Random();
    int selectAttackMove = random.nextInt(attack.length);
    setAttack = attack[selectAttackMove];
  }

  @override
  String attackPlayer(Player player) {
    Random random = new Random();
    int attackOrSwing = random.nextInt(100);
    selectAttack();
    if(attackOrSwing <= 20) {
      print("""
      Minotaur attacks you with an $weapon!
      \nYou take ${damage + 5} damage
      \nIt has $health health left!
      """);
      player.currentPlayerHealth = player.currentPlayerHealth - (damage + 5);
    } else if (attackOrSwing >= 21) {
      print("$setAttack\nHe does $damage damage!");
    }
    return setAttack;
  }

  @override
  bool? isDead;

  @override
  bool checkIfDead() {
    if(health <= 0) {
      print("The Minotaurs health reaches 0 and he slams to the ground!");
      isDead = true;
    } else {
      isDead = false;
    }
    return isDead!;
  }
}

class Goblin implements Monster {
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
  void attackPlayer(Player player) {
    Random random = new Random();
    int attackOrSwing = random.nextInt(100);
    selectAttack();
    if(attackOrSwing <= 20) {
      print("""
      Goblin attacks you with a $weapon!"
      \nYou take ${damage + 2} damage
      \nIt has $health health left!"""
      );
      player.currentPlayerHealth = player.currentPlayerHealth - (damage + 2);
    } else if (attackOrSwing >= 21) {
      print("$setAttack\nHe does $damage damage!");
    }
  }
  void selectAttack() {
    Random random = new Random();
    int selectAttackMove = random.nextInt(attack.length);
    setAttack = attack[selectAttackMove];
  }

  @override
  bool? isDead;

  @override
  bool checkIfDead() {
    if(health <= 0) {
      print("The Goblins health reaches 0 and he falls on the ground!");
      isDead = true;
    } else {
        isDead = false;
    }
    return isDead!;
  }
}

class Wolf implements Monster {
  @override
  List<String> attack = [
    "Wolf runs at you and bites you!",
    "Wolf swipes at you",
    "Wolf howls at you"
  ];

  @override
  int damage = 10;

  @override
  int health = 100;

  @override
  String setAttack = "";

  @override
  void attackPlayer(Player player) {
      selectAttack();
      if (setAttack.contains("howl")) {
        howl(player);
        return;
      } else {
        print("$setAttack\nHe does $damage damage!");
      }
  }
  void selectAttack() {
    Random random = new Random();
    int selectAttackMove = random.nextInt(attack.length);
    setAttack = attack[selectAttackMove];
  }

  bool howl(Player player) {
    bool isTrue = false;
    while(isTrue = true) {
      player.playerDamage = player.playerDamage - 3;
    }
    if (setAttack.contains("howl")) {
      print("You get effected by his howl\nYour damage is reduced by 3");
      isTrue = true;
      player.debuffs = true;
    }
    return isTrue;
  }

  @override
  bool? isDead;

  @override
  bool checkIfDead() {
    if(health == 0) {
      print("The Wolfs health reaches 0 and he howls his last howl!");
      isDead = true;
    } else {
      isDead = false;
    }
    return isDead!;
  }
}

