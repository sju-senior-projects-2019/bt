import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:my_master/background.dart';
import 'package:my_master/puckman.dart';

class MazeGame extends Game {
  Size screenSize;
  double tileSize;
  Background background;
  Puckman puck;

  MazeGame() {
    initialize();
  }

  void initialize() async {
    resize(await Flame.util.initialDimensions());

    background = Background(this);
    spawnPuck();
  }

  void spawnPuck() {
    double x = screenSize.width / 2;
    double y = screenSize.height / 2;
    puck = Puckman(this, x, y);
  }

  void render(Canvas canvas){
    background.render(canvas);

    puck.render(canvas);
  }

  void update(double t) {
    // TODO: make update()
  }

  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;
  }

  void handleDrag(Offset p) {

  }
}