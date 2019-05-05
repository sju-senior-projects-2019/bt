import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:my_master/MazeGame.dart';

class Background {
  final MazeGame game;
  Sprite bgSprite;
  Rect bgRect;

  Background(this.game) {
    bgSprite = Sprite('maze-1-resize.png');
    bgRect = Rect.fromLTWH(
      0,
      game.screenSize.height - (game.tileSize * 10),
      game.tileSize * 9,
      game.tileSize * 10,
    );
  }

  void render(Canvas c) {
    bgSprite.renderRect(c, bgRect);
  }

  void update(double t) {}
}