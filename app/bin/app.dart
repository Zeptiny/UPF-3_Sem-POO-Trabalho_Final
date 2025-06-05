import 'dart:io';
import './mocks/mockLevel.dart';

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

          hero.actions[acSelection].execute(
            level.enemies[0],
          ); // Alterar para o inimigo

          // TO-DO, refazer as ações
          // Não faz sentido a ação ter o execute com o Hero e alvo
          // Talvez fazer algum execute na própria entidade com o indice da ação e qual o alvo?

          break;
        }
      } else {
        // Inimigo deve realizar uma ação aleatória, baseada nas opções dadas a ele
        print("TO-DO");
        break;
      }
    }

    print(""); // Nova linha
  }
}
