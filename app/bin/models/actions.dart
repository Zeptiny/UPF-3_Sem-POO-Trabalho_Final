import 'entities.dart';
import 'dart:math';

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
      print('${this._executingEntity?.name} usou um ataque básico causando $finalDamage de dano!\n');
    }

    target.takeDamage(finalDamage);

    // target.takeDamage(finalDamage);
    print('Situação: \n');
    print('${target.name} tomou $finalDamage de dano. Vida restante: ${target.health}/${target.maxHealth}\n'); //precisa declarar um getter?
  }

  }


// Negar ou diminuir o dano que está recebendo
class ActionParry extends Action {
  int _blockChance; //chance de desviar 

  ActionParry(String _name, this._blockChance) : super(_name);

  void execute(Entity target, {int? incomingDamage}) { //target o inimigo que está atacando
    // Precisa de um alvo?
    // Como vamos checar isso realmente? com o if coming == null soldado!


      if (incomingDamage == null) {
      print("404! Nenhum dano de entrada!");
      return; // Sai da função se não houver dano para desviar
    }

    var random = Random(); // reutilizar o mesmo nome né :-)



   if (random.nextInt(100) < _blockChance) { // Gera um número de 0 a 99

      //se o numero ser menor que 49 o parry sera bem sucedido
      //


      // Parry bem-sucedido!
      print('${this._executingEntity?.name} executou ${this.name} com sucesso!');
      print('O ataque de ${target.name} (${incomingDamage} de dano) foi desviado/bloqueado!');
      // Não faz nada, pois o dano já foi evitado aqui
    } else {
      // Parry falhou! O herói recebe o dano normalmente
      print('${this._executingEntity?.name} tentou ${this.name}, mas falhou!');
      print('${this._executingEntity?.name} sofreu ${incomingDamage} de dano!');
      this._executingEntity?.takeDamage(incomingDamage); // Herói toma o dano
    }




  }
}

// Chance de fazer o inimigo não atacar por 1 round
class ActionBlowAttack extends Action {
  int _damage;
  int _chanceToStun;

  ActionBlowAttack(super._name, this._damage, this._chanceToStun);
                                    //essas variaveis são para o PARRY 
  void execute(Entity target, {int? damageOverride, int? incomingDamage}) { //fazendo o blow attack
    // Precisa de um alvo?
    // Como vamos checar isso realmente?
    target.takeDamage(this._damage);

    print('${this._executingEntity?.name} desfere um Golpe Poderoso em ${target.name}, causando ${this._damage} de dano!'); //o dano esta definido lá no app.dart
    print('${target.name} tomou ${this._damage} de dano. Vida restante: ${target.health}/${target.maxHealth}'); //blow attack será menos efetivo que dano normal?
  }
}
