import 'entities.dart';

abstract class Item {
  String _name;
  String _description;

  Item(this._name, this._description);

   // Getters
  String get name => _name;
  String get description => _description;
}
//Será melhor definila como abstrata?
abstract class Potion extends Item {
  int _effectStrength;
  String _effectType; //Heal etc

  Potion(
    String _name,
    String _description,
    this._effectStrength,
    this._effectType,
  ) : super(_name, _description);

  int get effectStrength  => _effectStrength;
  String get effectType => _effectType;

  //metodo abstrato para efeito da poção
  void useEffect(Entity user);
}
 //implementando a poçao de cura
class Healing extends Potion{
  Healing(String name, String description, int healAmount) : super(name,description, healAmount, 'heal'); //EffectType é heal

  
   @override
  void useEffect(Entity user) {
    print('${user.name} usa a ${this.name} e recupera ${this.effectStrength} de vida!');
    user.heal(this.effectStrength); // Chama o método heal na Entity
  }
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



