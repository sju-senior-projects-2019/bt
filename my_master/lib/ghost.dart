import 'dart:ui';
import 'package:my_master/MazeGame.dart';
import 'package:flame/sprite.dart';
import 'dart:math';

const SPEED = 50;

class Ghost {
  final MazeGame game;
  Sprite rightSprite, leftSprite, upSprite, downSprite, blueSprite;
  bool isOffScreen = false;
  Eyes facing;
  double ghostX, ghostY, ghostSize;
  Rect ghostRect;
  Size size;
  Mode mode;

  var num;
  int rand = 1;



  Ghost(this.game, double thisX, double thisY) {
    size = Size(32, 32);
    ghostRect = Rect.fromLTWH(thisX, thisY, size.width, size.height);

    rightSprite = Sprite('red-right.png');
    leftSprite = Sprite('red-left.png');
    upSprite = Sprite('red-up.png');
    downSprite = Sprite('red-down.png');
    blueSprite = Sprite('blue.jpg');


    ghostX = thisX;
    ghostY = thisY;
    mode = Mode.normal;


    facing = Eyes.right;
    num = new Random();
  }

  void turn() {
    if (!isOffScreen) {
      rand = num.nextInt(4);
      switch (rand) {
        case 1:
          facing = Eyes.right;
          break;
        case 2:
          facing = Eyes.down;
          break;
        case 3:
          facing = Eyes.left;
          break;
        case 4:
          facing = Eyes.up;
          break;
      }
    }
  }

  void render(Canvas c) {
    if (!isOffScreen) {
      if (mode == Mode.blue)
        blueSprite.renderRect(c, ghostRect);
      else if (mode == Mode.normal) {
        switch (facing) {
          case Eyes.right:
            {
              rightSprite.renderRect(c, ghostRect);
            }
            break;

          case Eyes.down:
            {
              downSprite.renderRect(c, ghostRect);
            }
            break;

          case Eyes.left:
            {
              leftSprite.renderRect(c, ghostRect);
            }
            break;

          case Eyes.up:
            {
              upSprite.renderRect(c, ghostRect);
            }
            break;
        }
      }
    }
  }

  void update(double t) {
    if (!isOffScreen) {
      switch (facing) {
        case Eyes.right:
          {
            if (ghostRect.right < game.screenSize.width) {
              ghostRect = Rect.fromLTWH(
                  ghostRect.left + t * SPEED, ghostRect.top, ghostRect.width,
                  ghostRect.height);
            }
          }
          break;

        case Eyes.down:
          {
            if (ghostRect.bottom < game.screenSize.height) {
              ghostRect = Rect.fromLTWH(
                  ghostRect.left, ghostRect.top + t * SPEED, ghostRect.width,
                  ghostRect.height);
            }
          }
          break;

        case Eyes.left:
          {
            if (ghostRect.left > 0) {
              ghostRect = Rect.fromLTWH(
                  ghostRect.left - t * SPEED, ghostRect.top, ghostRect.width,
                  ghostRect.height);
            }
          }
          break;

        case Eyes.up:
          {
            if (ghostRect.top > 0) {
              ghostRect = Rect.fromLTWH(
                  ghostRect.left, ghostRect.top - t * SPEED, ghostRect.width,
                  ghostRect.height);
            }
          }
          break;
      }
    }
  }

}

enum Eyes {
  right,
  left,
  up,
  down
}

enum Mode {
  normal,
  blue
}