import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location = "";
  String time = "";
  String flag = "";
  String url = "";
  bool isDayTime = false;

  WorldTime({ required this.url, required this.flag, required this.location});

  Future<void> getTime() async {

    try {
      Uri uri = Uri.parse('http://worldtimeapi.org/api/timezone/$url');
      Response response = await get(uri);
      Map data = jsonDecode(response.body);
      //print(data);

      String dateTime = data["datetime"];
      String offset = data["utc_offset"].toString().substring(1, 3);
      //print(dateTime);
      //print(offset);

      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));
      //print(now);

      isDayTime = now.hour > 6 && now.hour < 18 ? true : false;
      time = DateFormat.jm().format(now);
    } catch(e) {
      print(e.toString());
      time = "Could not get time data";
    }
  }
}



