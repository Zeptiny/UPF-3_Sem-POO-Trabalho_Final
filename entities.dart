
abstract class entities{
  String name;
  int health;
  int level;
  String sprite; //oq seria?
  String description; // lembrar que o nome tem que ser minusculo
  List<String> actions = [];

  //ver como fazer o takedamge?

}

class hero extends entities{
  String weapon; //a ver como vai funcionar
  List<String> consumables = ["Alimento 1", "Alimento 2", "Alimento 3"];
}

class enemy extends entities{
  String type;
  //there is something more to add?

}







void main(){
  print("Is it working?");


}