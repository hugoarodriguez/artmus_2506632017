class Canciones{

  List<Cancion> items = [];

  Canciones();

  Canciones.fromJsonList( List<dynamic> jsonList){

    if(jsonList == null) return;

    for(var item in jsonList){
      final cancion = Cancion.fromJsonMap(item);
      items.add(cancion);
    }
  }
}

class Cancion {

  String uniqueId = "0";//Propiedad inventada para diferenciar ID para uso del Hero Animation

  String nombreAlbum = 'Nombre';
  String imagenAlbum = 'ruta';
  String nombreCancion = 'Nombre';
  String imagenCancion = 'ruta';
  String duracionCancion = '1:00';
  int id = 0;

  Cancion({
    required this.nombreAlbum,
    required this.imagenAlbum,
    required this.nombreCancion,
    required this.imagenCancion,
    required this.duracionCancion,
    required this.id,
  });

  Cancion.fromJsonMap(Map<String, dynamic> json){
    nombreAlbum             = json["nombreAlbum"] ?? '';
    imagenAlbum      = json["imagenAlbum"] ?? '';
    nombreCancion             = json["nombreCancion"] ?? '';
    imagenCancion      = json["imagenCancion"] ?? '';
    duracionCancion      = json["duracionCancion"] ?? '';
    id                = json["id"] ?? 0;
  }

  getPosterImg(){

    if(imagenCancion == null){
      return 'https://i.stack.imgur.com/y9DpT.jpg';
    }else{
      return imagenCancion;
    }
  }

}