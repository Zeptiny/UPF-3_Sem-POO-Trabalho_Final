import 'items.dart';
import 'entities.dart';

class Level{
  String _name;
  String _description;
  List<Enemy> _enemies;
  List<Item> _lootPool;

  Level(this._name, this._description, this._enemies, this._lootPool);
}

