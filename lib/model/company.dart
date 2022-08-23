class Company{
  String? name;
  String? catchPhrase;
  String? bs;

  Company.fromJson(Map<String,dynamic>? data){
    if(data != null){
      name = data["name"];
      catchPhrase = data["catchPhrase"];
      bs = data["bs"];
    }    
  }
}