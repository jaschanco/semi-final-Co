import 'package:flutter/material.dart';

import 'homepage.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch:Colors.amber,
      scaffoldBackgroundColor:Colors.amber[100]
    ),
    home: const HomePage(),
  ));
}