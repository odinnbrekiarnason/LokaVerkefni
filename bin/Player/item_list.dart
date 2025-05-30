import '../Functions/function_exporter.dart';

class Items {
  List<Weapon> weapons = [
    Weapon(name: "ShortSword", damage: 10, description: "A tiny sword not that great damage"),
    Weapon(name: "Longsword", damage: 15, description: "A mighty sword meant for knights"),
    Bow(name: "Bow", damage: 13, description: "A fine instrument of death dates back over 200 years!"),
    Weapon(name: "Battle Axe", damage: 17, description: "A massive two sided axe, probably used by vikings"),
    Weapon(name: "Dagger", damage: 6, description: "A tiny knife, no reach and terrible damage"),
  ];

  List<Healing> healingItems = [
    Healing(name: "Healing Potion", healing: 20, description: "Heals you for 20 health"),
    Healing(name: "Bandage", healing: 10, description: "Heals you for 10 health"),
  ];

  List<Secondary> secondaryItems= [
    Secondary(name: "Arrow", description: "Arrow"),
    Secondary(name: "Milk", description: "Just a milk carton... it removes debuffs!"),
  ];
  List<Key> keys = [
    Key(name: "Key", description: "A key to open a door", id: 1),
    Key(name: "Key", description: "A key to open a door", id: 2),
    Key(name: "Key", description: "A key to open a door", id: 3),
    Key(name: "Key", description: "A key to open a door", id: 4),
    Key(name: "Key", description: "A key to open a door", id: 5),
    Key(name: "Key", description: "A key to open a door", id: 6),
    Key(name: "Key", description: "A key to open a door", id: 7),
    Key(name: "Key", description: "A key to open a door", id: 8),
    Key(name: "Key", description: "A key to open a door", id: 9),
    Key(name: "Key", description: "A key to open a door", id: 10),
    Key(name: "BossRoomKey", description: "A key to open a door to the boss room", id: 11),
  ];

  List<NoItemInChest> noItem = [];

  //Items({required this.weapons, required this.secondaryItems, required this.healingItems, required this.keys});
  /*List<Items> getItemList(List<Items> item) {
    item = [];
    item.add(weapons);
    item.add(healingItems);
    item.add(secondaryItems);
    item.add(keys);
    return item;
  }*/
}



