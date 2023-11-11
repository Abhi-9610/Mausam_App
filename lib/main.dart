import 'package:flutter/material.dart';
import 'package:mausam_world/home.dart';
import 'package:mausam_world/loading.dart';
// import 'package:mausam_world/location.dart';

void main() => runApp(MaterialApp(
debugShowCheckedModeBanner: false,
  routes: {
  '/':(context)=>loading(cityName: null,),
    '/home':(context)=>home(),
'/loading':(context) => loading(cityName: null,),

  },
));
