class Artistas{

  List<Artista> items = [];

  Artistas();

  Artistas.fromJsonList( List<dynamic> jsonList){

    if(jsonList == null) return;

    for(var item in jsonList){
      final pelicula = Artista.fromJsonMap(item);
      items.add(pelicula);
    }
  }
}

class Artista {

  String uniqueId = "0";//Propiedad inventada para diferenciar ID para uso del Hero Animation

  String estado = 'Activo';
  String imagenPortrait = 'ruta';
  String imagenLandscape = 'ruta';
  int id = 0;
  String nombre = 'Nombre';
  String generoMusical = 'Genero';
  String paisOrigen = 'País origen';
  String descripcionBiografica = 'Descripción';

  Artista({
    required this.estado,
    required this.imagenPortrait,
    required this.imagenLandscape,
    required this.id,
    required this.nombre,
    required this.generoMusical,
    required this.paisOrigen,
    required this.descripcionBiografica,
  });

  Artista.fromJsonMap(Map<String, dynamic> json){
    estado             = json["estado"] ?? '';
    imagenPortrait      = json["imagenPortrait"] ?? '';
    imagenLandscape      = json["imagenLandscape"] ?? '';
    id                = json["id"] ?? 0;
    nombre  = json["nombre"] ?? '';
    generoMusical     = json["generoMusical"] ?? '';
    paisOrigen          = json["paisOrigen"] ?? '';
    descripcionBiografica          = json["descripcionBiografica"] ?? '';
  }

  getPosterImg(){

    if(imagenPortrait == null){
      return 'https://i.stack.imgur.com/y9DpT.jpg';
    }else{
      return imagenPortrait;
    }
  }

  getBackgroundImg(){

    if(imagenLandscape == null){
      return 'https://i.stack.imgur.com/y9DpT.jpg';
    }else{
      return imagenLandscape;
    }
  }
  
}