// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, await_only_futures

import 'package:artmus_2506632017/src/models/artista_model.dart';
import 'package:flutter/material.dart';

class SolicitarCancionScreen extends StatelessWidget {
  const SolicitarCancionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final artista = ModalRoute.of(context)!.settings.arguments as Artista;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Text('Solicitud de Canción'),
      ),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 50.0,),
      
                Text('Artista: ${artista.nombre}', style: TextStyle(color: Colors.white, fontSize: 30.0) ),
                SizedBox( height: 30.0 ),
                _SolicitudForm(),
                SizedBox( height: 30.0 ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SolicitudForm extends StatefulWidget {

  @override
  State<_SolicitudForm> createState() => _SolicitudFormState();
}

class _SolicitudFormState extends State<_SolicitudForm> {
  
  final _formKey = GlobalKey<FormState>();

  //Controladores
  final TextEditingController _nombre = TextEditingController();
  final TextEditingController _correo = TextEditingController();
  final TextEditingController _descripcion = TextEditingController();


  @override
  Widget build(BuildContext context) {

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20.0,),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      elevation: 10.0,
      child: Form(
        key: _formKey,
        child: Column(
          children: [

            SizedBox( height: 30 ),

            //Nombre
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: TextFormField(
                controller: _nombre,
                autocorrect: false,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  hintText: 'Juan Pérez',
                  labelText: 'Nombre',
                  prefixIcon: Icon(Icons.text_fields_rounded)
                ),
                validator: ( value ) {

                    return (value != '')
                      ? null
                      : 'Debes ingresar tu nombre';

                },
              ),
            ),

            SizedBox( height: 30 ),

            //Correo
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: TextFormField(
                controller: _correo,
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'correo@gmail.com',
                  labelText: 'Correo electrónico',
                  prefixIcon: Icon(Icons.alternate_email_rounded)
                ),
                validator: ( value ) {

                    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                    RegExp regExp  = RegExp(pattern);
                    
                    return regExp.hasMatch(value ?? '')
                      ? null
                      : 'Correo no válido';

                },
              ),
            ),

            SizedBox( height: 30 ),

            //Descripción
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: TextFormField(
                maxLines: 10,
                controller: _descripcion,
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Mi descripción de canción',
                  labelText: 'Describa la canción',
                  prefixIcon: Icon(Icons.music_note_rounded ),
                ),
                validator: ( value ) {

                    return (value != '')
                      ? null
                      : 'Debes ingresar la descripción';

                },
              ),
            ),

            SizedBox( height: 30 ),

            //Botón
            MaterialButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Colors.indigo,
              child: Container(
                padding: EdgeInsets.symmetric( horizontal: 80, vertical: 15),
                child: Text('Enviar',style: TextStyle( color: Colors.white ),
                )
              ),
              onPressed: () async {
                
                if(_formKey.currentState!.validate()){
                  bool r = await true;

                  if(r){
                    //Si se guardó la descripción
                    _nombre.clear();
                    _correo.clear();
                    _descripcion.clear();

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Enviando solicitud'), backgroundColor: Colors.green.shade400,)
                    );

                    //Redirigimos a pantalla de consulta
                    Navigator.pop(context);
                  } else {
                    //Si no se guardó la descripción
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('No se pudo enviar la solicitud'))
                      );
                  }

                }
              }
            ),
            SizedBox( height: 30 ),

          ],
        ),
      ),
    );
  }
}