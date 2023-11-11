import 'dart:convert';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mausam_world/loading.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:weather_icons/weather_icons.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);
  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  TextEditingController searchtext = new TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('init state running');
  }

  @override
  Widget build(BuildContext context) {
    var city_name = ["Mumbai", "Jaipur", "Delhi", "Noida"];
    final _random = new Random();
    var info =
        jsonDecode(jsonEncode(ModalRoute.of(context)?.settings.arguments));
    var temp = (info['temp_value']).toString();
    var air_speed = info['speed_value'].toString();
    if (temp == 'N/A') {
      print('nakjofja');
    } else {
      temp = (info['temp_value']).toString().substring(0, 4);
      air_speed = info['speed_value'].toString().substring(0, 4);
    }

    // var temp = (info['temp_value']).toString().substring(0, 4);
    var icon = info['icon_value'].toString();
    var getcity = info['city_value'];
    // var air_speed = info['speed_value'].toString().substring(0, 4);
    var Hum = info['Hum_value'].toString();
    var desc = info['descr_value'].toString();
    var city = city_name[_random.nextInt(city_name.length)];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: NewGradientAppBar(
            gradient: LinearGradient(colors: [Colors.cyan, Colors.pinkAccent])),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  // begin: AlignmentDirectional.topCenter,
                  // end: Alignment.bottomCenter,
                  colors: [Colors.cyan, Colors.pinkAccent]),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          print(searchtext.text);
                          // Navigator.pushNamed(context, "/loading", arguments: {
                          //   'search': searchtext.text,
                          // });
                          if ((searchtext.text).replaceAll(' ', '') == '') {
                            print('blank');
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) =>
                                        loading(cityName: searchtext.text)));
                          }
                        },
                        child: Container(
                          child: Icon(Icons.search),
                          padding: EdgeInsets.symmetric(horizontal: 5),
                        ),
                      ),
                      Expanded(
                          child: TextField(
                        controller: searchtext,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search your City'),
                      )),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(15)),
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.network(
                        "https://openweathermap.org/img/wn/$icon@2x.png",
                        height: 100,
                        width: 100,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Column(
                        children: [
                          Text(
                            '$desc ',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1),
                          ),
                          Text(
                            '$getcity',
                            style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 280,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(15)),
                        padding:
                            EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              WeatherIcons.thermometer,
                              size: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '$temp',
                                  style: TextStyle(fontSize: 100),
                                ),
                                Text(
                                  'C',
                                  style: TextStyle(fontSize: 40),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        height: 210,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(15)),
                        padding:
                            EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                        margin: EdgeInsets.fromLTRB(20, 0, 5, 0),
                        child: Column(
                          children: [
                            Icon(
                              Icons.wind_power,
                              size: 40,
                            ),
                            Text(
                              '$air_speed',
                              style: TextStyle(fontSize: 50),
                            ),
                            Text(
                              'Km/h',
                              style: TextStyle(fontSize: 20),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 210,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(15)),
                        padding:
                            EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                        margin: EdgeInsets.fromLTRB(5, 0, 20, 0),
                        child: Column(
                          children: [
                            Icon(
                              WeatherIcons.humidity,
                              size: 40,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              '$Hum',
                              style: TextStyle(fontSize: 50),
                            ),
                            Text(
                              '%',
                              style: TextStyle(fontSize: 20),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                          // color: Colors.white,
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                          child: Center(
                              child: Text(
                            'Made By Abhishek Verma',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ))),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
