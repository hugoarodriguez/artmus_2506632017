import 'package:artmus_2506632017/src/data/arreglos_data_albums.dart';
import 'package:artmus_2506632017/src/models/album_model.dart';

class AlbumsProvider{

  final List<Album> _albums = [];
  ArreglosDataAlbums arreglosData = ArreglosDataAlbums();

  List<Album> _procesarRespuesta(){

    for (var i = 0; i < 10; i++) {
      Album album = Album(
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
}