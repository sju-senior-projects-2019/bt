import 'package:flame/flame.dart';
import 'package:my_master/MazeGame.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flame/util.dart';
import 'package:flutter/gestures.dart';

void main() async {
  Util flameUtil = Util();
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);

  Flame.images.loadAll(<String>[
    'assets/images/maze-1-resize.png',
    'assets/images/puck.png',
    ]);

  MazeGame game = MazeGame();
  runApp(game.widget);

  //Flame.util.addGestureRecognizer(createDragRecognizer());
}

/*
GestureRecognizer createDragRecognizer() {
  return new ImmediateMultiDragGestureRecognizer()
    ..onStart = (Offset position) => this.handleDrag(position);
}
*/