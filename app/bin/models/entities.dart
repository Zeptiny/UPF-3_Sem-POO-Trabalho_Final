// tipo? inicia o tipo como null
// _ antes do nome inicia como privado
abstract class Entity{
  String _name; // Daria para setar como final?
  String _description;
  int _health = 0;
  int _level = 0;
  String _sprite; // ASCII da entidade para aparecer no terminal
  //List<Action> _actions; // TO-DO Ações que a entidade pode realizar no combate, falta criar elas
  
  // Constructors https://dart.dev/language/constructors
  // Contrutor nomeada, a subclasse não herda ele
  Entity.full(this._name, this._description, this._health, this._level, this._sprite);
  //Entity(this._name, this._description, this._health, this._level, this._sprite, this._actions);

  // Getters
  String getName(){
    return _name;
  }

  String getDescription(){
    return _description;
  }

  int getHealth(){
    return _health;
  }

  int getLevel(){
    return _level;
  }

  String getSprite(){
    return _sprite;
  }

  // List<Action> getActions(){
  //   return _actions;
  // }

  // Setters
  // TO-DO

  // Methods https://dart.dev/language/methods
  void takeDamage(int damage){
    _health -= damage;
    // Fazer a entidade morrer, TO-DO
  }
}

// https://dart.dev/language/extend
class Hero extends Entity{
  //Weapon invSlotWeapon;
  //List<Consumable> invSlotConsumables;

  // Constructors

  // Ta reclamando de super parameters, não sei como resolver 
  // https://dart.dev/tools/diagnostics/use_super_parameters?utm_source=dartdev&utm_medium=redir&utm_id=diagcode&utm_content=use_super_parameters
  Hero(String name, String description, int health, int level, String sprite) : super.full(name, description, health, level, sprite);
}

class Enemy extends Entity{
  String type;

  Enemy(this.type, String name, String description, int health, int level, String sprite) : super.full(name, description, health, level, sprite);

  // Getters
  String getType(){
    return type;
  }
}