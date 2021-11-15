// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:artmus_2506632017/src/models/cancion_model.dart';
import 'package:artmus_2506632017/src/widgets/staggered_enter_animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReproducirCancionScreen extends StatelessWidget {

  late Cancion cancion;

  ReproducirCancionScreen({
    Key? key,
    required AnimationController controller,
  })  : animation = StaggeredEnterAnimation(controller),
        super(key: key);
  final StaggeredEnterAnimation animation;

  @override
  Widget build(BuildContext context) {

    cancion = ModalRoute.of(context)!.settings.arguments as Cancion;

    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: AnimatedBuilder(
        animation: animation.controller,
        builder: (context, child) => _buildAnimation(context, child, size),
      ),
    );
  }

  Widget _buildAnimation(BuildContext context, Widget? child, Size size) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 150,
          child: Stack(
            clipBehavior: Clip.none, children: <Widget>[
              topBar(animation.barHeight.value),
              circle(
                size,
                animation.avaterSize.value,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: <Widget>[
              SizedBox(height: 60),
              Opacity(
                opacity: animation.titleOpacity.value,
                child: placeholderBoxTitle(28, 150, Alignment.center),
              ),
              SizedBox(height: 8),
              Opacity(
                opacity: animation.textOpacity.value,
                child:
                    placeholderBoxSong(250, double.infinity, Alignment.centerLeft),
              ),
            ],
          ),
        )
      ],
    );
  }

  Container topBar(double height) {
    return Container(
      height: height,
      width: double.infinity,
      color: Colors.blue,
    );
  }

  Positioned circle(Size size, double animationValue) {
    return Positioned(
      top: 100,
      left: size.width / 2 - 50,
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.diagonal3Values(
          animationValue,
          animationValue,
          1.0,
        ),
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.blue.shade700,
          ),
          child: IconButton(
            color: Colors.white,
            onPressed: (){}, 
            icon: Icon(Icons.play_arrow_rounded, size: 80.0,)),
        ),
      ),
    );
  }

  Align placeholderBoxTitle(double height, double width, Alignment alignment) {
    return Align(
      alignment: alignment,
      child: Container(
        alignment: Alignment.center,
        child: Text('Reproduciendo', style: TextStyle(fontWeight: FontWeight.bold  ),),
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.grey.shade300,
        ),
      ),
    );
  }

  Align placeholderBoxSong(double height, double width, Alignment alignment) {
    return Align(
      alignment: alignment,
      child: Container(
        alignment: Alignment.center,
        child: Text(cancion.nombreCancion, style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold  ),),
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.grey.shade300,
        ),
      ),
    );
  }
}