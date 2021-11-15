// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:artmus_2506632017/src/providers/albums_provider.dart';

class DetalleAlbumScreen extends StatelessWidget {  

  @override
  Widget build(BuildContext context) {

    final album = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            _crearAppBar(album),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  SizedBox(height: 10.0),
                  _posterTitulo(context, album),
                  _crearListadoCanciones(album)
                ]
              )
            )
          ],
        ),
      ),
    );
  }

  Widget _crearAppBar(album){

    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.indigoAccent,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          album.nombreArtista,
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        background: FadeInImage(
          image: AssetImage(album.imagenArtista),
          placeholder: AssetImage('assets/img/loading.gif'),
          fadeInDuration: Duration(milliseconds: 150),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _posterTitulo(BuildContext context, album){

    album.uniqueId = '${album.id}-posteralbum';

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: <Widget>[
          Hero(
            tag: album.uniqueId,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image(
                image: AssetImage(album.getPosterImg()),
                height: 250.0,
                width: 150.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 20.0),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(album.nombreAlbum, style: Theme.of(context).textTheme.headline6, overflow: TextOverflow.ellipsis, ),
              ],
            )
          )
        ],
      ),
    );

  }

  Widget _crearListadoCanciones(album){

    final albumsProvider = AlbumsProvider();

    return FutureBuilder(
      future: albumsProvider.getCanciones(album.id, album.nombreAlbum, album.imagenAlbum),
      builder: (context, AsyncSnapshot<List> snapshot) {
        if(snapshot.hasData){
          return _crearCancionesPageView(context, snapshot.data);
        }else{
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _crearCancionesPageView(BuildContext context, canciones){

    return SizedBox(
      height: 300.0,
      child: PageView.builder(
        pageSnapping: false,
        controller: PageController(
          viewportFraction: 0.3,
          initialPage: 1
        ),
        itemCount: canciones.length,
        itemBuilder: (context, i) => _cancionTarjeta(context, canciones[i]),
      )
    ); 
  }

  Widget _cancionTarjeta(BuildContext context, cancion){
    
    return Container(
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: GestureDetector(
                child: FadeInImage(
                  image: AssetImage(cancion.getPosterImg()),
                  placeholder: AssetImage('assets/img/no-image.jpg'),
                  height: 150.0,
                  width: 100.0,
                  fit: BoxFit.cover,
                ),
                onTap: () => Navigator.pushNamed(context, 'detalle', arguments: cancion),
              ),
            ),
            Text(
              cancion.nombreCancion,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
    );

  }
  

}