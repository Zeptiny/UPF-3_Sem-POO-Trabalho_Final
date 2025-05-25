import 'models/entities.dart';
void main(List<String> arguments) {
  var hero = Hero("Carlitos", "Carlitos é brabo", 20, 0, "( ͡° ͜ʖ ͡°)");
  var enemy = Enemy("Comum", "Carlitos", "Carlitos é brabo", 20, 0, "( ͡° ͜ʖ ͡°)");

  print(hero.getName());
  print(enemy.getType());
  print(enemy.getHealth());
}
