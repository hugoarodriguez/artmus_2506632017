// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

import 'package:artmus_2506632017/src/providers/artistas_provider.dart';

class DetalleArtistaScreen extends StatelessWidget {  

  @override
  Widget build(BuildContext context) {

    final artista = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            _crearAppBar(artista),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  SizedBox(height: 10.0),
                  _posterTitulo(context, artista),
                  _descripcionArtista(artista),
                  _crearDiscografia(artista)
                ]
              )
            )
          ],
        ),
      ),
    );
  }

  Widget _crearAppBar(artista){

    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.indigoAccent,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          artista.nombre,
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        background: FadeInImage(
          image: AssetImage(artista.getBackgroundImg()),
          placeholder: AssetImage('assets/img/loading.gif'),
          fadeInDuration: Duration(milliseconds: 150),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _posterTitulo(BuildContext context, artista){

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: <Widget>[
          Hero(
            tag: artista.uniqueId,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image(
                image: AssetImage(artista.getPosterImg()),
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
                Text(artista.nombre, style: Theme.of(context).textTheme.headline6, overflow: TextOverflow.ellipsis, ),
                Text(artista.generoMusical, style: Theme.of(context).textTheme.subtitle1, overflow: TextOverflow.ellipsis),
                Row(
                  children: <Widget>[
                    Icon(Icons.check_circle_outline_rounded),
                    Text(artista.estado, style: Theme.of(context).textTheme.subtitle1)
                  ],
                )
              ],
            )
          )
        ],
      ),
    );

  }

  Widget _descripcionArtista(artista){

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: Text(
        artista.descripcionBiografica,
        textAlign: TextAlign.justify,
      ),
    );

  }

  

  Widget _crearDiscografia(artista){

    final artistasProvider = ArtistasProvider();

    return FutureBuilder(
      future: artistasProvider.getAlbums(artista.id, artista.nombre, artista.getBackgroundImg()),
      builder: (context, AsyncSnapshot<List> snapshot) {
        if(snapshot.hasData){
          return _crearAlbumsPageView(context, snapshot.data);
        }else{
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _crearAlbumsPageView(BuildContext context, albums){

    return SizedBox(
      height: 200.0,
      child: PageView.builder(
        pageSnapping: false,
        controller: PageController(
          viewportFraction: 0.3,
          initialPage: 1
        ),
        itemCount: albums.length,
        itemBuilder: (context, i) => _albumTarjeta(context, albums[i]),
      )
    ); 
  }

  Widget _albumTarjeta(BuildContext context, album){
    
    return Container(
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: GestureDetector(
              child: FadeInImage(
                image: AssetImage(album.getPosterImg()),
                placeholder: AssetImage('assets/img/no-image.jpg'),
                height: 150.0,
                width: 100.0,
                fit: BoxFit.cover,
              ),
              onTap: () => Navigator.pushNamed(context, 'detalleAlbum', arguments: album),
            ),
          ),
          Text(
            album.nombreAlbum,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );

  }
  

}