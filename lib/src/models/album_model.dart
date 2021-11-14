class Albums{

  List<Album> items = [];

  Albums();

  Albums.fromJsonList( List<dynamic> jsonList){

    if(jsonList == null) return;

    for(var item in jsonList){
      final album = Album.fromJsonMap(item);
      items.add(album);
    }
  }
}

class Album {

  String uniqueId = "0";//Propiedad inventada para diferenciar ID para uso del Hero Animation

  String nombreAlbum = 'Nombre';
  String imagenAlbum = 'ruta';
  int id = 0;

  Album({
    required this.nombreAlbum,
    required this.imagenAlbum,
    required this.id,
  });

  Album.fromJsonMap(Map<String, dynamic> json){
    nombreAlbum             = json["estado"] ?? '';
    imagenAlbum      = json["imagenPortrait"] ?? '';
    id                = json["id"] ?? 0;
  }

  getPosterImg(){

    if(imagenAlbum == null){
      return 'https://i.stack.imgur.com/y9DpT.jpg';
    }else{
      return imagenAlbum;
    }
  }

}