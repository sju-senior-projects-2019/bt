import 'dart:ui';
import 'package:my_master/MazeGame.dart';
import 'package:flame/sprite.dart';

class Puckman {
  final MazeGame game;
  Rect puckRect;
  Sprite puckSprite;

  Puckman(this.game, double x, double y) {
    puckSprite = Sprite('puck.png');
    puckRect = Rect.fromLTWH(x, y, 64, 64);

  }

  void render(Canvas c) {
    puckSprite.renderRect(c, puckRect);
  }

  void update(double t) {

  }

}