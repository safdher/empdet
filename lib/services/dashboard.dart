import 'dart:convert';

import 'package:empdet/helper/singleton.dart';
import 'package:http/http.dart' as http;

class DashboardService {
    Future<void> fetchData() async{
      http.Response response = await http.get(Uri.parse("http://www.mocky.io/v2/5d565297300000680030a986"));
      List<dynamic> data = jsonDecode(response.body);

      for(var i in data){
        if(i["profile_image"] != null){
          http.Response resp = await http.get(Uri.parse(i["profile_image"]));   
          String url = i["profile_image"];
          await Singleton().insertPictureData(url, resp.bodyBytes);
        }  
        String jsonToStr = jsonEncode(i);
        await Singleton().insertSyncData(jsonToStr);
      }
    }
}
