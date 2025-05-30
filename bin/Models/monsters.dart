import '../Functions/function_exporter.dart';

abstract class Monster {
  int get coin => getCoin();
  String name = "";
  int damage = 0;
  double health = 0;
  List<String> attack = [];
  String setAttack = "";
  bool? isDead;

  void attackPlayer(Player player) {
  }
  bool checkIfDead(Player player) {
    return isDead!;
  }
}

class Minotaur implements Monster {
  @override
  int get coin => getCoin();
  @override
  String name = "Minotaur";

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
  double health = 120;

  void selectAttack() {
    Random random = Random();
    int selectAttackMove = random.nextInt(attack.length);
    setAttack = attack[selectAttackMove];
  }

  @override
  String attackPlayer(Player player) {
    Random random = Random();
    int attackOrSwing = random.nextInt(100);
    selectAttack();
    if(attackOrSwing <= 20) {
      print("""
      Minotaur attacks you with a $weapon!
      \nYou take ${damage + 5} damage
      \nYou have ${player.currentPlayerHealth} health left!
      \nIt has $health health left!
      """);
      player.currentPlayerHealth = player.currentPlayerHealth - (damage + 5);
    } else if (attackOrSwing >= 21) {
      print("$setAttack\nHe does $damage damage!");
      player.currentPlayerHealth = player.currentPlayerHealth - damage;
      print("Your health: ${player.currentPlayerHealth}");
      print("Its health: $health");
    }
    return setAttack;
  }

  @override
  bool? isDead;

  @override
  bool checkIfDead(Player player) {
    if(health <= 0) {
      print("The Minotaurs health reaches 0 and he slams to the ground!");
      print("You get $coin gold!");
      player.coin = player.coin + coin;
      isDead = true;
    } else {
      isDead = false;
    }
    return isDead!;
  }
}

class Goblin implements Monster {
  @override
  int get coin => getCoin();

  @override
  String name = "Goblin";

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
  double health = 60;

  @override
  void attackPlayer(Player player) {
    Random random = Random();
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
      print("Your health: ${player.currentPlayerHealth}");
      print("Its health: $health");
    }
  }
  void selectAttack() {
    Random random = Random();
    int selectAttackMove = random.nextInt(attack.length);
    setAttack = attack[selectAttackMove];
  }

  @override
  bool? isDead;

  @override
  bool checkIfDead(Player player) {
    if(health <= 0) {
      print("The Goblins health reaches 0 and he falls on the ground!");
      print("You get $coin gold!");
      player.coin = player.coin + coin;
      isDead = true;
    } else {
        isDead = false;
    }
    return isDead!;
  }
}

class Wolf implements Monster {
  @override
  int get coin => getCoin();

  @override
  String name = "Wolf";

  @override
  List<String> attack = [
    "Wolf runs at you and bites you!",
    "Wolf swipes at you",
    "Wolf howls at you"
  ];

  @override
  int damage = 15;

  @override
  double health = 50;

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
        player.currentPlayerHealth = player.currentPlayerHealth - damage;
        print("Your health: ${player.currentPlayerHealth}");
        print("Its health: $health");
      }
  }
  void selectAttack() {
    Random random = Random();
    int selectAttackMove = random.nextInt(attack.length);
    setAttack = attack[selectAttackMove];
  }

  bool howl(Player player) {
    bool isTrue = false;
    while(isTrue = true) {
      player.playerDamage = player.playerDamage - 3;
    }
    if (setAttack.contains("howl")) {
      print("You get a headache because his howl was so loud\nYou get a damage debuff, your damage is reduced by 3");
      isTrue = true;
      player.debuffs = true;
      player.debuffNames.add("Damage reduction");
    }
    return isTrue;
  }

  @override
  bool? isDead;

  @override
  bool checkIfDead(Player player) {
    if(health == 0) {
      print("The Wolfs health reaches 0 and he howls his last howl!");
      print("You get $coin gold!");
      player.coin = player.coin + coin;
      isDead = true;
    } else {
      isDead = false;
    }
    return isDead!;
  }
}
//Ef eg hef tíma gera fleyrri monsters!

class RoyalSpectre implements Monster {
  @override
  int get coin => getCoin();

  @override
  int damage = 30;

  @override
  String name = "Royal Spectre";

  @override
  List<String> attack = [
    "The Spectre swipes his wand and a fireball comes hurling your way!",
    "The Spectre starts chanting quietly... its a huge tsunami!",
    "The Spectre blows a whistle.. Huh that's wierd..\nNothing happe- \n'You get sliced with wind'",
    "The Spectre starts chanting loudly\nA huge boulder is ripped out of the ground and is thrown your way"
  ];

  @override
  double health = 250;

  @override
  bool? isDead;

  @override
  String setAttack = "";

  @override
  void attackPlayer(Player player) {
    selectAttack();
    print(setAttack);
    print("Your health: ${player.currentPlayerHealth}");
    print("Spectres health: $health}");
  }

  void selectAttack() {
    Random random = Random();
    int selectAttackMove = random.nextInt(attack.length);
    setAttack = attack[selectAttackMove];
  }

  @override
  bool checkIfDead(Player player) {
    if(health == 0) {
      print("The Spectre's health drops to 0 and he evaporates into smoke!");
      isDead = true;
    } else {
      isDead = false;
    }
    return isDead!;
  }
}

