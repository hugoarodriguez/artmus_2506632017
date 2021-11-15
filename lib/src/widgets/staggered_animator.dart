// ignore_for_file: use_key_in_widget_constructors

import 'package:artmus_2506632017/src/screens/reproducir_cancion_screen.dart';
import 'package:flutter/material.dart';

class StaggeredAnimator extends StatefulWidget {
  @override
  _StaggeredAnimatorState createState() => _StaggeredAnimatorState();
}

class _StaggeredAnimatorState extends State<StaggeredAnimator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ReproducirCancionScreen(
      controller: _controller,
    );
  }
}