import 'dart:io';
import 'dart:math';
import '../Models/character.dart';
import '../Models/item.dart';

class Items {
  List<Weapon> weapons = [
    Weapon(name: "ShortSword", damage: 10, description: "A tiny sword not that great damage"),
    Weapon(name: "Longsword", damage: 15, description: "A mighty sword meant for knights"),
    Bow(name: "Bow", damage: 13, description: "A fine instrument of death dates back over 200 years!"),
    Weapon(name: "Battle Axe", damage: 17, description: "A massive two sided axe, probably used by vikings"),
    Weapon(name: "Dagger", damage: 8, description: "A tiny knife, no reach and terrible damage"),
  ];

  List<Healing> healingItems = [
    Healing(name: "Healing Potion", healing: 20, description: "Heals you for 20 health"),
    Healing(name: "Bandage", healing: 10, description: "Heals you for 10 health"),
  ];

  List<Secondary> secondaryItems= [
    Secondary(name: "Arrow", description: "Arrow"),
    Secondary(name: "Milk", description: "Just a milk carton... it removes debuffs!"),

  ];
}
