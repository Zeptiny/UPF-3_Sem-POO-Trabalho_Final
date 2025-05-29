import 'entities.dart';

// OBSERVAÇÕES

// Acredito que maior parte dessas ações não precisam de um alvo
// O dano e chance de stun pkoderia ser pego da arma do heroi
// Acredito que devemos revisar a implementação, ou tentar desenvolver algo mais "real" antes de chegarmos aqui
// Não sei se essa é a melhor forma de implementar ações

abstract class Action {
  String _name;

  Action(this._name);

  void execute(Entity hero, Entity target);
}

class ActionAttack extends Action {
  int _damage;

  ActionAttack(super._name, this._damage);

  void execute(Entity hero, Entity target) {
    // Conferir o dano da arma do heroi
    // Diminuir a vida do alvo
    // ?!?!?!
    // Stonks
  }
}

// Negar ou diminuir o dano que está recebendo
class ActionParry extends Action {
  int _blockChance;

  ActionParry(super._name, this._blockChance);

  void execute(Entity hero, Entity target) {
    // Precisa de um alvo?
    // Como vamos checar isso realmente?
  }
}

// Chance de fazer o inimigo não atacar por 1 round
class ActionBlowAttack extends Action {
  int _damage;
  int _chanceToStun;

  ActionBlowAttack(super._name, this._damage, this._chanceToStun);

  void execute(Entity hero, Entity target) {
    // Precisa de um alvo?
    // Como vamos checar isso realmente?
  }
}
