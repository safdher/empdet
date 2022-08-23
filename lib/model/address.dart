class Address{
  String? street;
  String? suite;
  String? city;
  String? zipcode;
  Geo? geo;


  Address.fromJson(Map<String,dynamic>? data){
    if(data != null){
      street = data["street"];
      suite = data["suite"];
      city = data["city"];
      zipcode = data["zipcode"];
      geo = Geo.fromJson(data["geo"]);
    }  
  }
}

class Geo{
  String? lat;
  String? lng;

  Geo.fromJson(Map<String,dynamic>? data){
    if(data!=null){
      lat = data["lat"];
      lng = data["lng"];
    }
  }
}