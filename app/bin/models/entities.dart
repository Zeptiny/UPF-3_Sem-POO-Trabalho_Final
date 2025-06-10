import 'actions.dart';
import 'items.dart';

// tipo? inicia o ti  po como null
// _ antes do nome inicia como privado
abstract class Entity {
  final String _name; // Daria para setar como final?
  String _description;
  int _health = 0;
  int _maxHealth;
  int _level = 0;
  String _sprite; // ASCII da entidade para aparecer no terminal
  List<Action>
  _actions; // TO-DO Ações que a entidade pode realizar no combate, falta criar elas
  List<String>? _status;
  List<Item> _inventory = []; // INVENTARIO   


   void heal(int amount) {
    _health += amount;
    
    if (_health > _maxHealth) {
      _health = _maxHealth;
    }
    print('${_name} curou ${amount} de vida. HP atual: ${_health}/${_maxHealth}');
  }




  // Constructors https://dart.dev/language/constructors
  // Contrutor nomeada, a subclasse não herda ele
  Entity.full(
    this._name,
    this._description,
    this._health,
    this._maxHealth,
    this._level,
    this._sprite,
    this._actions,
  );
  
  //Entity(this._name, this._description, this._health, this._level, this._sprite, this._actions);

  // Getters

  get name => this._name;
  get description => this._description;
  get health => this._health;
  get level => this._level;
  get sprite => this._sprite;
  get actions => this._actions;
  get maxHealth => this._maxHealth;
  get inventory => this._inventory;

  set setActions(List<Action> actions) {
    for (Action a in actions){
      a.setEntity = this; //mensagem
      this._actions += [a];
    }
  }

  void takeDamage(int damage){
    this._health -= damage;
    if(this._health <= 0){ //para quando der zero o bichao morrer né 
      this._health = 0;
      print("Você venceu!"); //talvez devessemos mudar para o main?
    }
  }

  //Heal metodo
   void healing(int amount) {
    _health += amount;
    // Ensure health does not exceed maxHealth
    if (_health > _maxHealth) {
      _health = _maxHealth;
    }
    print('${_name} curou ${amount} de vida. HP atual: ${_health}/${_maxHealth}');
  }


  bool get isAlive => this._health > 0; //vereficar se o biao ta morto

  //metodo do inventario pae
  void addItemToInventory(Item item) {
    _inventory.add(item);
    print('${_name} pegou um(a) ${item.name}!');
  }
}

// https://dart.dev/language/extend
class Hero extends Entity {
  //Weapon invSlotWeapon;
  //List<Consumable> invSlotConsumables;

  // Constructors

  // Ta reclamando de super parameters, não sei como resolver
  // https://dart.dev/tools/diagnostics/use_super_parameters?utm_source=dartdev&utm_medium=redir&utm_id=diagcode&utm_content=use_super_parameters
  Hero(
    String name,
    String description,
    int health,
    int level,
    String sprite,
    List<Action> actions,
  ) : super.full(name, description, health, health, level, sprite, actions);
}

class Enemy extends Entity {
  String type;

  Enemy(
    this.type,
    String name,
    String description,
    int health,
    int level,
    String sprite,
    List<Action> actions,
  ) : super.full(name, description, health, health, level, sprite, actions);

  // Getters
  String getType() {
    return type;
  }






    void useItem(Item itemToUse) {
    if (_inventory.contains(itemToUse)) {
      if (itemToUse is Potion) { 
        Potion potion = itemToUse; 
        potion.useEffect(this);
        _inventory.remove(itemToUse); 
        print('${itemToUse.name} foi consumida.');
      } else {
        
        print('${itemToUse.name} não é uma poção ou não tem um efeito de uso direto neste contexto.');
      }
    } else {
      print('${name} não tem ${itemToUse.name} no inventário.');
    }
  }
  
  
  // Isso facilita a interação no terminal
  void useItemByName(String itemName) {
    Item? itemFound;
    for (var item in _inventory) {
      if (item.name.toLowerCase() == itemName.toLowerCase()) {
        itemFound = item;
        break;
      }
    }
    if (itemFound != null) {
      useItem(itemFound);
    } else {
      print('$itemName não encontrado no inventário de ${name}.');
    }
  }
}


