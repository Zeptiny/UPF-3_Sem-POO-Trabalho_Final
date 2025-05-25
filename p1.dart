class Test{ //classe
  int idade;
  String nome;
  String cpf;

}

//constrructores
class Animal{
  String nome;
  String especie;

  //constructor gerador

  Animal(this.nome, this.especie);

}

void main(){
  print("Ola Mundo!");
  double one = 3.323;

  
  // Uso do construtor
  var meuAnimal = Animal("Trinta", "cachorro"); // Corrigido para meuAnimal (camelCase)

  // Para ver as propriedades do objeto, você pode imprimir:
  print("Nome do animal: ${meuAnimal.nome}");
  print("Espécie do animal: ${meuAnimal.especie}");

  print("Valor: ${one}");
}