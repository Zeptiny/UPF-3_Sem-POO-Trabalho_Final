abstract class Item {
  String _name;
  String _description;

  Item(this._name, this._description);
}

class Consumable extends Item {
  int _effectStrength;
  String _effectType;

  Consumable(
    String _name,
    String _description,
    this._effectStrength,
    this._effectType,
  ) : super(_name, _description);
}

class Weapon extends Item {
  int _damage;
  String _damageType;

  Weapon(String _name, String _description, this._damage, this._damageType)
    : super(_name, _description);
}

class Melee extends Weapon {
  // TO-DO

  Melee(String _name, String _description, int _damage, String _damageType)
    : super(_name, _description, _damage, _damageType);
}

class Ranged extends Weapon {
  // TO-DO
  Ranged(String _name, String _description, int _damage, String _damageType)
    : super(_name, _description, _damage, _damageType);
}
