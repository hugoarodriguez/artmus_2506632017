// ignore_for_file: import_of_legacy_library_into_null_safe, must_be_immutable, use_key_in_widget_constructors, prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:artmus_2506632017/src/providers/artistas_provider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';


class CardSwiper extends StatelessWidget {
  
  final artistasProvider = ArtistasProvider();
  var data;
  CardSwiper({required this.data});

  @override
  Widget build(BuildContext context) {
    List artistas = data;

    final _screenSize = MediaQuery.of(context).size;

    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(top: 5.0),
        child: Swiper(
          layout: SwiperLayout.STACK,
          itemWidth: _screenSize.width * 0.7,
          itemHeight: _screenSize.height * 0.7,
          itemBuilder: (BuildContext context, int index) {

            artistas[index].uniqueId = '${artistas[index].id}-poster';

            return Hero(
              tag: artistas[index].uniqueId,
              child: Column(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child:  GestureDetector(
                        child: FadeInImage(
                          image: AssetImage(artistas[index].getPosterImg()),
                          placeholder: const AssetImage('assets/img/no-image.jpg'),
                          fit: BoxFit.cover
                        ),
                        onTap: () => Navigator.pushNamed(context, 'detalle', arguments: artistas[index]),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5.0,),
                  Text(artistas[index].nombre, style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                ],
              ),
            );
          },
          itemCount: artistas.length,
        ),
      ),
    );
  }
}