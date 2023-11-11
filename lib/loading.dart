import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mausam_world/worker/worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class loading extends StatefulWidget {
  String? cityName;
  loading({Key? key,required this.cityName}) : super(key: key);
  @override
  State<loading> createState() => _loadingState();
}

class _loadingState extends State<loading> {



  String tempratre = '';
  String Hum = '';
  String speed = '';
  String descr = '';
  String Main = '';
  String icon ='';
  String city="";
  startapp(String? cityName) async {
    worker instance = cityName!=null?worker(cityName):worker("jaipur");
    await instance.getdata();
    tempratre = instance.temperature;
    Hum = instance.Humidity;
    speed = instance.Air_speed;
    descr = instance.description;
    Main = instance.main;
    icon = instance.icon;
    city = instance.City;

    //Navigator.push(context,MaterialPageRoute(builder: (_)=>home()));
    Future.delayed(Duration(seconds: 1), () {
      Navigator.pushReplacementNamed (  context   , '/home', arguments: {
        'temp_value': tempratre,
        'Hum_value': Hum,
        'speed_value': speed,
        'descr_value': descr,
        'Main_value': Main,
        'icon_value':icon,
        'city_value':city,
      });
    });
  }

  @override
  void initState() {
    //var args = jsonDecode(jsonEncode(ModalRoute.of(context)?.settings.arguments));
    startapp(widget.cityName);
    super.initState();
    print('init state running');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Image.asset(
                'images/mausam_logo.jpeg',
                color: const Color.fromRGBO(255, 255, 255, 0.8),
                colorBlendMode: BlendMode.modulate,
                height: 500,
              ),
              // SizedBox(height: 20,),
              // Text('Mausam App'),
              SizedBox(
                height: 20,
              ),
              SpinKitWave(
                color: Colors.blue[300],
                size: 50.0,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Loading',
                style: TextStyle(
                  fontSize: 20,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
