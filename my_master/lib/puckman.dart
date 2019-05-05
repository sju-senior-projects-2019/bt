import 'dart:ui';
import 'package:my_master/MazeGame.dart';
import 'package:flame/sprite.dart';

const SPEED = 50;

class Puckman {
  final MazeGame game;
  Sprite rightSprite, leftSprite, upSprite, downSprite;
  bool isOffScreen = false;
  Face facing;
  double puckX, puckY;
  Rect puckRect;
  Size size;


  Puckman(this.game, double thisX, double thisY) {
    size = Size(32, 32);
    puckRect = Rect.fromLTWH(thisX, thisY, size.width, size.height);

    rightSprite = Sprite('puck-right.png');
    leftSprite = Sprite('puck-left.png');
    upSprite = Sprite('puck-up.png');
    downSprite = Sprite('puck-down.png');


    puckX = thisX;
    puckY = thisY;


    facing = Face.right;
  }

  void render(Canvas c) {
    if(!isOffScreen) {
      switch (facing) {
        case Face.right:
          {
            rightSprite.renderRect(c, puckRect);
          }
          break;

        case Face.down:
          {
            downSprite.renderRect(c, puckRect);
          }
          break;

        case Face.left:
          {
            leftSprite.renderRect(c, puckRect);
          }
          break;

        case Face.up:
          {
            upSprite.renderRect(c, puckRect);
          }
          break;
      }
    }
  }

  void update(double t) {
    if (!isOffScreen) {
      switch (facing) {
        case Face.right:
          {
            if (puckRect.right < game.screenSize.width) {
              puckRect = Rect.fromLTWH(
                  puckRect.left + t * SPEED, puckRect.top, puckRect.width,
                  puckRect.height);
            }
          }
          break;

        case Face.down:
          {
            if (puckRect.bottom < game.screenSize.height) {
              puckRect = Rect.fromLTWH(
                  puckRect.left, puckRect.top + t * SPEED, puckRect.width,
                  puckRect.height);
            }
          }
          break;

        case Face.left:
          {
            if (puckRect.left > 0) {
              puckRect = Rect.fromLTWH(
                  puckRect.left - t * SPEED, puckRect.top, puckRect.width,
                  puckRect.height);
            }
          }
          break;

        case Face.up:
          {
            if (puckRect.top > 0) {
              puckRect = Rect.fromLTWH(
                  puckRect.left, puckRect.top - t * SPEED, puckRect.width,
                  puckRect.height);
            }
          }
          break;
      }
    }
  }

}

enum Face {
  right,
  left,
  up,
  down
}