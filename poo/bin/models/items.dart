abstract class Item{
  String name;
  String description;

  Item(this.name, this.description);
}

class Consumable extends Item{
  int effectStrength;
  String effectType;

  Consumable(String name, String description, this.effectStrength, this.effectType) : super(name, description);
}


class Weapon extends Item{
  int damage;
  String damageType;

  Weapon(String name, String description, this.damage, this.damageType) : super(name, description);
}

class Melee extends Weapon{
// TO-DO

  Melee(String name, String description, int damage, String damageType) : super(name, description, damage, damageType);
}

class Ranged extends Weapon{
// TO-DO
  Ranged(String name, String description, int damage, String damageType) : super(name, description, damage, damageType);
}
