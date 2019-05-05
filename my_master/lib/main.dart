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
    'assets/images/puck-right.png',
    'assets/images/puck-down.png',
    'assets/images/puck-left.png',
    'assets/images/puck-up.png',
    'assets/images/big-pellet.png',

    'assets/images/ui-left.png',
    'assets/images/ui-right.png',
    'assets/images/ui-up.png',
    'assets/images/ui-down.png',

    'assets/images/red-left.png',
    'assets/images/red-up.png',
    'assets/images/red-down.png',
    'assets/images/red-right.png',
    'assets/images/blue.png',
  ]);

  Flame.audio.loadAll(<String>[
    'assets/audio/moon.mp3',
    'assets/audio/go.mp3',
  ]);

  MazeGame game = MazeGame();
  runApp(game.widget);

  while(game.State == active)
  Flame.audio.play('moon.mp3');

  TapGestureRecognizer tapControl = TapGestureRecognizer();
  tapControl.onTapDown = game.onTapDown;
  flameUtil.addGestureRecognizer(tapControl);
}

