// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:artmus_2506632017/src/models/artista_model.dart';
import 'package:artmus_2506632017/src/providers/artistas_provider.dart';

class DataSearch extends SearchDelegate{

  @override
  String get searchFieldLabel => 'Búscar...';

  String seleccion = '';
  final artistasProvider = ArtistasProvider();


  @override
  List<Widget> buildActions(BuildContext context) {
      // Las acciones de nuestro AppBar
      
      return [
        IconButton(
          icon: const Icon(Icons.clear), 
          onPressed: (){
            query = '';
          },
        )
      ];
    }
  
    @override
    Widget buildLeading(BuildContext context) {
      // Icono a la izquierda del AppBar
      
      //Escondemos el teclado al invocar este método, de esta forma no muestra el error de 'RenderFlex overflowed'
      //Esta es una alternativa a usar si el Expanded del card_swiper_widget.dart no funciona
      //FocusScope.of(context).requestFocus(new FocusNode());

      return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ), 
        onPressed: (){
          close(context, null);
        }
      );
    }
  
    @override
    Widget buildResults(BuildContext context) {
      // Crea los resultados que vamos a mostrar

      if(query.isEmpty) return Container(); 
      
      return buildSuggestions(context);
    }
  
    @override
    Widget buildSuggestions(BuildContext context) {
    // Son las sugerencias que aparecen cuando la persona escribe

    List<Artista>? artistas;
    
    if(query.isEmpty){
      if(artistas != null){
        artistas.clear();
      }
      
      return Container();
    }

    return FutureBuilder(
      future: artistasProvider.buscarArtista(query),
      builder: (BuildContext context, AsyncSnapshot<List<Artista>> snapshot) {

        if(snapshot.hasData){

          artistas = snapshot.data;

          return ListView(
            children: artistas!.map((artista){

              return ListTile(
                leading: FadeInImage(
                  image: AssetImage(artista.getBackgroundImg()),
                  placeholder: const AssetImage('assets/img/no-image.jpg'),
                  width: 50.0,
                  fit: BoxFit.cover,
                ),
                title: Text(artista.nombre, style: TextStyle(color: Colors.white),),
                subtitle: Text(artista.paisOrigen, style: TextStyle(color: Colors.white),),
                onTap: (){
                  //close(context, null);//Cerramos el búscador
                  artista.uniqueId = '';//Vaciamos el uniqueId ya que no haremos el efecto Hero
                  Navigator.pushNamed(context, 'detalle', arguments: artista);//Navegamos a la página de detalle
                },
              );
            }).toList()
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }

      },
    );
  }

  /* 
  @override
    Widget buildSuggestions(BuildContext context) {
    // Son las sugerencias que aparecen cuando la persona escribe

    final listaSugerida = (query.isEmpty) 
                          ? peliculasRecientes
                          : peliculas.where(
                            (p) => p.toLowerCase().startsWith(query.toLowerCase())
                          ).toList();
    
    return ListView.builder(
      itemCount: listaSugerida.length,
      itemBuilder: (context, i){
        return ListTile(
          leading: Icon(Icons.movie),
          title: Text(listaSugerida[i]),
          onTap: (){
            seleccion = listaSugerida[i];
            showResults(context);
           },
        );
      }
    );
  }
  */

}