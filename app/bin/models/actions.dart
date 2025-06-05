import 'entities.dart';

// OBSERVAÇÕES

// Acredito que maior parte dessas ações não precisam de um alvo
// O dano e chance de stun pkoderia ser pego da arma do heroi
// Acredito que devemos revisar a implementação, ou tentar desenvolver algo mais "real" antes de chegarmos aqui
// Não sei se essa é a melhor forma de implementar ações

abstract class Action {
  String _name;
  Entity? _executingEntity;

  get name => this._name;

  set setEntity(Entity e) => this._executingEntity = e;

  Action(this._name);

  //modificação agora recebe quem executa e e o alvo ++
  void execute(Entity target);
}

 class ActionAttack extends Action {
  // Não precisamos de um _damage aqui, pois o dano será passado via damageOverride
  ActionAttack(super.name); // Construtor simples

  @override 
  void execute(Entity target, {int? damageOverride}) { //para ser mais facíl de aplicar o dano, recebe dano, aplicar dano
    int finalDamage = 0; // Inicializa a variável para o dano final

    if (damageOverride != null) {
      // Se um dano foi explicitamente passado (calculado pelo CombatSystem)
      finalDamage = damageOverride;
      print('${this._executingEntity?.name} ataca causando $finalDamage de dano!');
    } else {
     
      finalDamage = 5; // Dano padrão caso não seja fornecido ou a entidade não tenha 'attackPower'
      print('${this._executingEntity?.name} realiza um ataque básico causando $finalDamage de dano!');
    }

    target.takeDamage(finalDamage);

    // target.takeDamage(finalDamage);
    print('${target.name} tomou $finalDamage de dano. Vida restante: ${target.health}/${target.maxHealth}'); //precisa declarar um getter?
  }

  }


// Negar ou diminuir o dano que está recebendo
class ActionParry extends Action {
  int _blockChance;

  ActionParry(String _name, this._blockChance) : super(_name);

  void execute(Entity target) {
    // Precisa de um alvo?
    // Como vamos checar isso realmente?
  }
}

// Chance de fazer o inimigo não atacar por 1 round
class ActionBlowAttack extends Action {
  int _damage;
  int _chanceToStun;

  ActionBlowAttack(super._name, this._damage, this._chanceToStun);

  void execute(Entity target) {
    // Precisa de um alvo?
    // Como vamos checar isso realmente?
  }
}
