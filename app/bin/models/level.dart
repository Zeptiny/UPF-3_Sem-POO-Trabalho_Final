import 'items.dart';
import 'entities.dart';

class Level{
  String _name;
  String _description;
  List<Enemy> _enemies;
  List<Item> _lootPool;


  get name => this._name;
  get description => this._description;
  get enemies => this._enemies;
  get lootPool => this._lootPool;
  get enemyCount => this._enemies.length;
  get lootPoolSize => this._lootPool.length;


  Level(this._name, this._description, this._enemies, this._lootPool);
}

