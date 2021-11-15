import 'package:artmus_2506632017/src/data/arreglos_data_albums.dart';
import 'package:artmus_2506632017/src/data/arreglos_data_canciones.dart';
import 'package:artmus_2506632017/src/models/album_model.dart';
import 'package:artmus_2506632017/src/models/cancion_model.dart';

class AlbumsProvider{

  final List<Album> _albums = [];
  ArreglosDataAlbums arreglosData = ArreglosDataAlbums();
  ArreglosDataCanciones arreglosDataCanciones = ArreglosDataCanciones();

  List<Album> _procesarRespuesta(){

    for (var i = 0; i < 10; i++) {
      Album album = Album(
        nombreArtista: 'Artista',
        imagenArtista: 'assets/img/no-image.jpg',
        nombreAlbum: arreglosData.nombresAlbums[i],
        imagenAlbum: arreglosData.rutasImagenesAlbums[i],
        id: i+1,
      );
      _albums.add(album);
    }

    return _albums.toList();
  }

  Future<List<Album>> getAlbums(int idArtista) async {

    _albums.clear();

    List<Album> albumsPorArtista = [];

    if(idArtista >= 0){
      albumsPorArtista = _procesarRespuesta();
    }

    return albumsPorArtista;
  }

  Future<List<Cancion>> getCanciones(int idAlbum, String nombreAlbum, String imagenAlbum) async {

    List<Cancion> cancionesPorAlbum = [];

    if(idAlbum >= 0){
      for (var i = 0; i < arreglosDataCanciones.nombresCanciones.length; i++) {
        Cancion cancion = Cancion(
          nombreAlbum: nombreAlbum,
          imagenAlbum: imagenAlbum,
          nombreCancion: arreglosDataCanciones.nombresCanciones[i],
          imagenCancion: arreglosDataCanciones.rutasImagenesCanciones[i],
          duracionCancion: arreglosDataCanciones.duracionCanciones[i],
          id: i+1,
        );
        cancionesPorAlbum.add(cancion);
      }
    }

    return cancionesPorAlbum;
  }
}