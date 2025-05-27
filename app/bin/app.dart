import 'dart:io';

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
}
