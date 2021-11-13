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

  bool estado = true;
  String imagenDeFondo = 'ruta';
  int id = 0;
  String nombre = 'Nombre';
  String generoMusical = 'Genero';
  String paisOrigen = 'País origen';
  String descripcion = 'Descropción';

  Artista({
    required this.estado,
    required this.imagenDeFondo,
    required this.id,
    required this.nombre,
    required this.generoMusical,
    required this.paisOrigen,
    required this.descripcion,
  });

  Artista.fromJsonMap(Map<String, dynamic> json){
    estado             = json["adult"] ?? true;
    imagenDeFondo      = json["backdrop_path"] ?? '';
    id                = json["id"] ?? 0;
    nombre  = json["original_language"] ?? '';
    generoMusical     = json["original_title"] ?? '';
    paisOrigen          = json["overview"] ?? '';
    descripcion          = json["descripcion"] ?? '';
  }

  getPosterImg(){

    if(imagenDeFondo == null){
      return 'https://i.stack.imgur.com/y9DpT.jpg';
    }else{
      return imagenDeFondo;
    }
  }

  getBackgroundImg(){

    if(imagenDeFondo == null){
      return 'https://i.stack.imgur.com/y9DpT.jpg';
    }else{
      return imagenDeFondo;
    }
  }
  
}