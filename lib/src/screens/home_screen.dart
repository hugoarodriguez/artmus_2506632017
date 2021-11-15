// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, use_key_in_widget_constructors, prefer_const_constructors

//import 'package:artmus_2506632017/src/models/artista_model.dart';
import 'package:flutter/material.dart';

import 'package:artmus_2506632017/src/providers/artistas_provider.dart';
import 'package:artmus_2506632017/src/search/search_delegate.dart';
import 'package:artmus_2506632017/src/widgets/card_swiper_widget.dart';

class HomeScreen extends StatelessWidget {

  final artistasProvider = ArtistasProvider();

  @override
  Widget build(BuildContext context) {

    artistasProvider.getArtistas();//Ejecución inicial de la carga de películas populares

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Buscar artista'),
        backgroundColor: Colors.indigoAccent,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search), 
            onPressed: (){
              
              showSearch(context: context, delegate: DataSearch());

            }
          )
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            SizedBox(height: 15.0,),
            Text('Toca una tarjeta para ver más...', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
            _swiperTarjetas(),
          ],
        ),
      )
    );
  }

  Widget _swiperTarjetas(){

    return FutureBuilder(
      future: artistasProvider.getArtistas(),
      builder: (BuildContext context, snapshot) {

        if(snapshot.hasData){
          final datos = snapshot.data;

          return CardSwiper(data: datos,);

        } else if(snapshot.hasError){

          return Container(
            height: 400.0,
            child: const Center(
              child: CircularProgressIndicator()),
          );

        }
        else{

          return Container(
            height: 400.0,
            child: const Center(
              child: CircularProgressIndicator()),
          );

        }

      },
    );
    
  }
}