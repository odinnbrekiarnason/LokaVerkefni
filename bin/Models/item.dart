import '../Models/character.dart';

class Item {
  final String name;
  final String description;

  Item({required this.name, required this.description});
}

 class Weapon extends Item{
  final int damage;
  int attack(Player player){
   return damage;

  }

  Weapon({required super.name, required this.damage, required super.description});

}

class Healing extends Item {
  final int healing;

  Healing({required super.name, required this.healing, required super.description});
}

class Secondary extends Item{
  int maxStack = 5;

  Secondary({required super.name, required super.description,});
}

class Bow implements Weapon {
  @override
  int damage = 13;

  @override
  String name = "Bow";

  @override
  String description = "A fine instrument of death dates back over 200 years!";

  @override
  int attack(Player player) {
    if(player.backpack.contains(Secondary(name: "Arrow", description: 'Arrow'))){
      player.backpack.remove(Secondary(name: "Arrow", description: 'Arrow'));
      int bowDamage = damage;
      return bowDamage;
    } else {
      print("No arrows in Backpack");
      return 0;
    }
  }

  Bow({required this.name, required this.damage, required this.description});
}
