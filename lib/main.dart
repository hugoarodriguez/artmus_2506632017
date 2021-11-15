// ignore_for_file: avoid_unnecessary_containers, use_key_in_widget_constructors

import 'package:artmus_2506632017/src/screens/reproducir_cancion_screen.dart';
import 'package:artmus_2506632017/src/widgets/staggered_animator.dart';
import 'package:flutter/material.dart';

import 'package:artmus_2506632017/src/screens/detalle_album_screen.dart';
import 'package:artmus_2506632017/src/screens/detalle_artista_screen.dart';
import 'package:artmus_2506632017/src/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.pinkAccent[200],),
      debugShowCheckedModeBanner: false,
      title: 'ArtMus',
      initialRoute: '/',
      routes: {
        '/'       : (BuildContext context) => HomeScreen(),
        'detalle'       : (BuildContext context) => DetalleArtistaScreen(),
        'detalleAlbum'       : (BuildContext context) => DetalleAlbumScreen(),
        'reproducir'       : (BuildContext context) => StaggeredAnimator(),
      },
    );
  }
}