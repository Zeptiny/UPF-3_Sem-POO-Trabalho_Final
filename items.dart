abstract class item{
  String name;
  String description;

}

class consumables extends items{
  int effectstrenght;
  String effecttype;

}


class weapon extends items{
  int damage;
  String damagetype;

}

class mele extends weapon{

}

class ranged extends weapon{

}


void main(){
   print("Teste");
}
