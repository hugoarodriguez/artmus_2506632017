// ignore_for_file: avoid_unnecessary_containers, use_key_in_widget_constructors

import 'package:artmus_2506632017/src/screens/detalle_artista_screen.dart';
import 'package:artmus_2506632017/src/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ArtMus',
      initialRoute: '/',
      routes: {
        '/'       : (BuildContext context) => HomeScreen(),
        'detalle'       : (BuildContext context) => DetalleArtistaScreen(),
      },
    );
  }
}