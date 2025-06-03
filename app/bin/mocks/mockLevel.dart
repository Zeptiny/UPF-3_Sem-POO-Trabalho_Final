import '../models/level.dart';
import '../models/entities.dart';
import '../models/actions.dart';
import '../models/items.dart';

List<Level> levels = [
  Level(
    "Level Uno",
    "Very much many level",
    [
      Enemy("Comum", "Goblino", "Very much goblino", 20, 0, "Sprite\nyay", [
        ActionAttack("Attack", 5),
        ActionBlowAttack("Blow Attack", 3, 70),
        ActionParry("Parry", 50),
      ]),
    ],
    [], // lootPool empty
  ),
  Level(
    "Level Dos",
    "Very much many wow level",
    [
      Enemy("Comum", "Skeletino", "Very much skeletino", 30, 1, "Sprite\nyay", [
        ActionAttack("Attack", 5),
        ActionBlowAttack("Blow Attack", 3, 70),
        ActionParry("Parry", 50),
      ]),
    ],
    [], // lootPool empty
  ),
  Level(
    "Level Tres",
    "Very much many wow level",
    [
      Enemy("Raro", "Maguino", "Very much wow maguino", 30, 2, "Sprite\nyay", [
        ActionAttack("Attack", 5),
        ActionBlowAttack("Blow Attack", 3, 70),
        ActionParry("Parry", 50),
      ]),
    ],
    [], // lootPool empty
  ),
];
