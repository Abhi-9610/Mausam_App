import 'package:http/http.dart' as http;
import 'dart:convert';

class worker {
  String location = '';

  worker(this.location){
    //constructor working
    location=location;
  }


  String temperature = '';
  String Humidity = '';
  String Air_speed = '';
  String description = '';
 String main='';
  String icon ='';
   String City ='';
   Future<void> getdata() async {
    try{
      String url =
          "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=14ee7cdd178beebb724788d3ea37bddd";
      http.Response response = await http.get(Uri.parse(url));
      Map data = json.decode(response.body);
      print(data);

      //getting wind speed
      Map temp_data = data['main'];
      Map wind=data['wind'];
      double air_speed=wind['speed']/0.27777777777778;

      //getting temperature
      double temp = temp_data['temp'] - 273.15;


      //  getting humidity
      int humidity=temp_data['humidity'];
      //getting weather report

      List weather_data = data['weather'];
      Map weather_main_data = weather_data[0];

      //getting decsription
      String main_des= weather_main_data['main'];
      String desc=weather_main_data['description'];

      //getting cityname
      City = data['name'];




      //  Assigning values
      temperature= temp.toString();
      Humidity=humidity.toString();
      Air_speed=air_speed.toString();
      description=desc;
      main=main_des;
      icon = weather_main_data["icon"].toString();

    } catch(e){
      temperature='N/A' ;
      Humidity='N/A';
      Air_speed='N/A';
      description='N/A';
      main='N/A';
      icon="50n";
    }
  }
}

