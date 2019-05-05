import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:my_master/MazeGame.dart';
import 'package:flame/sprite.dart';

class GamePad{
  final MazeGame game;
  Sprite rightPad, leftPad, upPad, downPad;
  Buttons pressed;
  double padSize, posX, posY;
  Rect padRect;

  GamePad(this.game){
    padSize = game.tileSize * 4;
    rightPad = Sprite('ui-right.png');
    leftPad = Sprite('ui-left.png');
    upPad = Sprite('ui-up.png');
    downPad = Sprite('ui-down.png');
    pressed = Buttons.right;
    posX = game.screenSize.width/2 - padSize/2;
    posY = 0;

    padRect = Rect.fromLTWH(posX, posY, padSize, padSize);

  }

  void onTapDown(TapDownDetails d) {
    if (d.globalPosition.dy < posY + (padSize/3) && d.globalPosition.dx < posX + 2*padSize/3){ // up press
      pressed = Buttons.up;
    }

    if (d.globalPosition.dy < posY + (2*padSize/3) && d.globalPosition.dx > posX + 2*padSize/3){ // up press
      pressed = Buttons.right;
    }

    if (d.globalPosition.dy > posY + (2*padSize/3) && d.globalPosition.dx >  posX + padSize/3){ // up press
      pressed = Buttons.down;
    }

    if (d.globalPosition.dy > posY + (padSize/3) && d.globalPosition.dx < posX + padSize/3){ // up press
      pressed = Buttons.left;
    }

    switch(pressed) {
      case Buttons.right: {
        game.dir = Direction.right;
      }
      break;

      case Buttons.down: {
        game.dir = Direction.down;
      }
      break;

      case Buttons.left: {
        game.dir = Direction.left;
      }
      break;

      case Buttons.up: {
        game.dir = Direction.up;
      }
      break;
    }
  }

  void render(Canvas c){
    switch (pressed) {
      case Buttons.left: {
        leftPad.renderRect(c, padRect);
      }
      break;

      case Buttons.right: {
        rightPad.renderRect(c, padRect);
      }
      break;

      case Buttons.up: {
        upPad.renderRect(c, padRect);
      }
      break;

      case Buttons.down: {
        downPad.renderRect(c, padRect);
      }
      break;
    }
  }

  void update(double t){
  }
}

enum Buttons{
  left,
  right,
  up,
  down,
}