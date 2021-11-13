import 'package:artmus_2506632017/src/models/artista_model.dart';
//import 'package:artmus_2506632017/src/models/actores_model.dart';

class ArtistasProvider{

  int _popularesPage = 0;
  bool _cargando = false;

  List<Artista> _artistas = [];

  List<Artista> _procesarRespuesta(){
    
    for (var i = 0; i < 10; i++) {
      Artista artista = Artista(
        estado: true,
        imagenDeFondo: 'assets/img/Megadeth.jpg',
        id: i+1,
        nombre: 'Nombre',
        generoMusical: 'Genero',
        paisOrigen: 'País',
        descripcion: 'Descripción'
      );
      _artistas.add(artista);
    }

    return _artistas.toList();

  }

  Future<List<Artista>> getArtistas() async {

    return _procesarRespuesta();
  }

   Future<List<Artista>> buscarArtista(String query) async {

    return _procesarRespuesta();
  }
}