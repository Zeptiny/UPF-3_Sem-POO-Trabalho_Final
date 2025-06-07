import 'dart:io';
import './mocks/mockLevel.dart';

import 'dart:math'; 

import 'models/entities.dart';
import 'models/actions.dart';

void main(List<String> arguments) {
  print("Qual o nome do herói? ");
  String? inName = stdin.readLineSync();
  String name = inName ?? 'default';
  print(""); // New Line

  print("Qual seria a história de $name?");
  String? inDescription = stdin.readLineSync();
  String description = inDescription ?? 'default';
  print(""); // New Line 

  // Level, vida e sprite padrão por enquanto
  // Ações padrões são: attack, parry e blow
  Hero hero = Hero(name, description, 20, 0, "( ͡° ͜ʖ ͡°)", []);
  hero.setActions = [
    ActionAttack("Attack"),
    ActionBlowAttack("Blow Attack", 3, 70),
    ActionParry("Parry", 50),
  ];

 
  // Main loopino
  bool heroNextRound = true;
  for (var level in levels) {
    print(level.name);
    print(level.description);
    print("Inimigos: ${level.enemyCount}");
    print("Loot Pool: ${level.lootPoolSize}");
    print(""); // New Line

    // Está apenas considerando o primeiro inimigo, TO-DO
    print(
      "${"${hero.name} | ${hero.health}".padRight(30)}${level.enemies[0].name} | ${level.enemies[0].health}",
    );
    // Sprites podem ter múltiplas linhas, mas todos devem ter a mesma altura senão algo pode pegar fogo
    print("${"${hero.sprite}".padRight(30)}${level.enemies[0].sprite}");

    // Iniciar o combate
    while (true) {
        //verefica a vida do heroi antes do combate
       if (!hero.isAlive) {
        print("${hero.name} foi derrotado!");
        print("Fim de jogo!");
        return;
      }
      //verefica a vida do inimigo
        if (!level.enemies[0].isAlive) {
        print("${level.enemies[0].name} foi derrotado!");
        print("Você venceu o combate contra ${level.enemies[0].name}!");
        break; // Isso quebra o while(true) de COMBATE, fazendo o for loop avançar
      }


      if (heroNextRound) {
        // Mostrar o menu de ações para o heroi
        List<Action> actions = hero.actions;
        int acNum = 1;
        for (var ac in actions) {
          print("$acNum - ${ac.name}");
          acNum++;
        }

        while (true) {
          String? acSelectionIn =
              stdin.readLineSync(); // Pega a string com a seleção do número
          if (acSelectionIn == null) {
            print("Seleção inválida!");
            continue;
          }

          if (int.tryParse(acSelectionIn) == null) {
            print("Seleção inválida!");
            continue;
          }

          int acSelection = int.parse(acSelectionIn);
          acSelection--; // 0 indexed list

          if (acSelection >= acNum) {
            print("Seleção inválida!");
            continue;
          }


          //PARRY ACTIONS!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          Action selectedAction = hero.actions[acSelection]; // Pega a ação selecionada



          if (selectedAction is ActionParry) {
            var rng = Random();
            int minEnemyDamage = 1;
            int maxEnemyDamage = 4;
            int potentialDamage = minEnemyDamage + rng.nextInt(maxEnemyDamage - minEnemyDamage + 1);

            selectedAction.execute(level.enemies[0], incomingDamage: potentialDamage);

            heroNextRound = true;
          } else {
            selectedAction.execute(level.enemies[0]);
            heroNextRound = false;
          }

          if (!level.enemies[0].isAlive) {
              print("${level.enemies[0].name} foi derrotado!");
              print("Você venceu o combate contra ${level.enemies[0].name}!");
              break;
          }

          break;




          /*

          VOU ALTERAR ISSO AQUI , VOCÊ ve como ficou


          hero.actions[acSelection].execute(
            level.enemies[0],
          ); // Alterar para o inimigo
          */

          // TO-DO, refazer as ações
          // Não faz sentido a ação ter o execute com o Hero e alvo
          // Talvez fazer algum execute na própria entidade com o indice da ação e qual o alvo?

          
        }
      } else { //Ataque do inimigo -- Testes
        //turno inimigo
        print("Inimigo ataca!");
        print("Turno do Inimigo: ${level.enemies[0].name}");
        var random =  Random();

        int MinenemyDamage = 1;
        int MaxenemyDamage = 4;

        // Gera um número aleatório entre minEnemyDamage e maxEnemyDamage 
        int randomDamage = MinenemyDamage + random.nextInt(MaxenemyDamage - MinenemyDamage + 1);

        // O inimigo (level.enemies[0]) usa sua primeira ação (assumindo que é um ataque)
        // contra o herói (hero), passando o dano aleatório.
        level.enemies[0].actions[0].execute(hero, damageOverride: randomDamage);
        //ver vida atual
      //não esta mostrando o hp?
      print("${hero.name} HP: ${hero.health}/${hero.maxHealth}");
      print("");

        if (!hero.isAlive) {
          print("${hero.name} foi derrotado por ${level.enemies[0].name}!");
          print("Fim de jogo!");
          return; // Termina o programa
        }

        heroNextRound = true; // Passa a vez de volta para o herói

      }
    }

    print(""); // Nova linha
  }
}
