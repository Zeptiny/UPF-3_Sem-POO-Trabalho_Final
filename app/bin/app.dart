import 'dart:io';
import './mocks/mockLevel.dart';

import 'models/entities.dart';

void main(List<String> arguments) {
  print("Qual o nome do herói? ");
  String? inName = stdin.readLineSync();
  String name = inName ?? 'default';

  print("Qual seria a história de $name?");
  String? inDescription = stdin.readLineSync();
  String description = inDescription ?? 'default';

  // Level, vida e sprite padrão por enquanto
  Hero hero = Hero(name, description, 20, 0, "( ͡° ͜ʖ ͡°)");

  // Main loopino
  bool heroNextRound = true; // 1 = Hero; 0 = Enemy;
  for (var level in levels) {
    print(level.name);
    print(level.description);
    print("Inimigos: ${level.enemyCount}");
    print("Loot Pool: ${level.lootPoolSize}");

    // Está apenas considerando o primeiro inimigo, TO-DO
    print("${"${hero.name} | ${hero.health}".padRight(30)}${level.enemies[0].name} | ${level.enemies[0].health}");
    // Sprites podem ter múltiplas linhas, mas todos devem ter a mesma altura senão algo pode pegar fogo
    print("${"${hero.sprite}".padRight(30)}${level.enemies[0].sprite}");

    // Iniciar o combate
    while(true){
      if(heroNextRound){
        // Mostrar o menu de ações para o heroi
        print("TO-DO");
        break;
      } else {
        // Inimigo deve realizar uma ação aleatória, baseada nas opções dadas a ele
        print("TO-DO");
        break;
      }
    }

    print(""); // Nova linha
  }
}
