import 'package:artmus_2506632017/src/data/arreglos_data.dart';
import 'package:artmus_2506632017/src/data/arreglos_data_albums.dart';
import 'package:artmus_2506632017/src/models/album_model.dart';
import 'package:artmus_2506632017/src/models/artista_model.dart';

class ArtistasProvider{

  int _popularesPage = 0;
  bool _cargando = false;

  final List<Artista> _artistas = [];
  ArreglosData arreglosData = ArreglosData();
  ArreglosDataAlbums arreglosDataAlbums = ArreglosDataAlbums();

  List<Artista> _procesarRespuesta(){

    for (var i = 0; i < 10; i++) {
      Artista artista = Artista(
        estado: arreglosData.estadosArtistas[i],
        imagenPortrait: arreglosData.rutasImagenesPortrait[i],
        imagenLandscape: arreglosData.rutasImagenesLandscape[i],
        id: i+1,
        nombre: arreglosData.nombresArtistas[i],
        generoMusical: arreglosData.generosArtistas[i],
        paisOrigen: arreglosData.paisOrigenArtistas[i],
        descripcionBiografica: arreglosData.descripcionBiograficaArtistas[i]
      );
      _artistas.add(artista);
    }

    return _artistas.toList();

  }

  Future<List<Artista>> getArtistas() async {

    return _procesarRespuesta();
  }

   Future<List<Artista>> buscarArtista(String query) async {
    List<Artista> artistasEncontrados = [];
     
    for (var i = 0; i < arreglosData.estadosArtistas.length; i++) {
      Artista artista = Artista(
        estado: arreglosData.estadosArtistas[i],
        imagenPortrait: arreglosData.rutasImagenesPortrait[i],
        imagenLandscape: arreglosData.rutasImagenesLandscape[i],
        id: i+1,
        nombre: arreglosData.nombresArtistas[i],
        generoMusical: arreglosData.generosArtistas[i],
        paisOrigen: arreglosData.paisOrigenArtistas[i],
        descripcionBiografica: arreglosData.descripcionBiograficaArtistas[i]
      );
      artistasEncontrados.add(artista);
    }
     

    artistasEncontrados = query.isEmpty
      ? []
      : artistasEncontrados.where((p) => p.nombre.toLowerCase().contains(query.toLowerCase())).toList();

    return artistasEncontrados;
  }

  Future<List<Album>> getAlbums(int idArtista) async {

    List<Album> albumsPorArtista = [];

    if(idArtista >= 0){
      for (var i = 0; i < arreglosDataAlbums.nombresAlbums.length; i++) {
        Album album = Album(
          nombreAlbum: arreglosDataAlbums.nombresAlbums[i],
          imagenAlbum: arreglosDataAlbums.rutasImagenesAlbums[i],
          id: i+1,
        );
        albumsPorArtista.add(album);
      }
    }

    return albumsPorArtista;
  }
}