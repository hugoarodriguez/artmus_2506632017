import 'package:artmus_2506632017/src/data/arreglos_data_canciones.dart';
import 'package:artmus_2506632017/src/models/cancion_model.dart';

class CancionesProvider{

  final List<Cancion> _albums = [];
  ArreglosDataCanciones arreglosData = ArreglosDataCanciones();

  List<Cancion> _procesarRespuesta(){

    for (var i = 0; i < 10; i++) {
      Cancion album = Cancion(
        nombreAlbum: 'Nombre Artista',
        imagenAlbum: 'assets/img/no-image.jpg',
        nombreCancion: arreglosData.nombresCanciones[i],
        imagenCancion: arreglosData.rutasImagenesCanciones[i],
        duracionCancion: arreglosData.duracionCanciones[i],
        id: i+1,
      );
      _albums.add(album);
    }

    return _albums.toList();
  }

  Future<List<Cancion>> getCanciones(int idAlbum) async {

    _albums.clear();

    List<Cancion> cancionesPorAlbum = [];

    if(idAlbum >= 0){
      cancionesPorAlbum = _procesarRespuesta();
    }

    return cancionesPorAlbum;
  }
}