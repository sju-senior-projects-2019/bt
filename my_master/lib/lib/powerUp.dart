import 'dart:ui';
import 'package:my_master/MazeGame.dart';
import 'package:flame/sprite.dart';

class PowerUp {
  final MazeGame game;
  Sprite sprite;
  bool isOffScreen = false;
  double powerX, powerY, powerSize;
  Rect powerRect;
  Size size;


  PowerUp(this.game, double thisX, double thisY) {
    size = Size(32, 32);
    powerRect = Rect.fromLTWH(thisX, thisY, size.width, size.height);

    sprite = Sprite('big-pellet.png');

    powerX = thisX;
    powerY = thisY;
  }

  void render(Canvas c) {
    if(!isOffScreen)
      sprite.renderRect(c, powerRect);
  }

  void update(double t) {
  }

}