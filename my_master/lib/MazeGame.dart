import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:my_master/background.dart';
import 'package:my_master/puckman.dart';
import 'package:my_master/gamePad.dart';
import 'package:my_master/ghost.dart';
import 'package:my_master/powerUp.dart';

class MazeGame extends BaseGame {
  Size screenSize;
  double tileSize;
  Background background;
  Puckman puck;
  GamePad pad;
  Direction dir;
  Ghost ghostGuy1, ghostGuy2;
  PowerUp big;
  int score = 0;
  int timer = 0;
  bool songPlayed = false;

  MazeGame() {
    initialize();
  }

  void initialize() async {
    resize(await Flame.util.initialDimensions());

    Flame.audio.loadAll(<String>[
      'assets/audio/moon.mp3',
      'assets/audio/go.mp3',
    ]);

    background = Background(this);
    pad = GamePad(this);
    dir = Direction.right;
    big = PowerUp(this, screenSize.width/2 - 32, screenSize.height - 32);
    spawnPuck();
    spawnGhosts();


  }

  void spawnGhosts() {
    ghostGuy1 = Ghost(this, screenSize.width / 4 - 16, screenSize.height / 4 - 16);
    ghostGuy2 = Ghost(this, (3 *screenSize.width / 4) - 16, screenSize.height / 4 - 16);

  }

  void spawnPuck() {
    double centerX = (screenSize.width / 2) - 16;
    double centerY = (screenSize.height / 2) - 16;
    puck = Puckman(this, centerX, centerY);
  }

  void render(Canvas canvas){
    background.render(canvas);
    big.render(canvas);
    pad.render(canvas);
    puck.render(canvas);
    ghostGuy1.render(canvas);
    ghostGuy2.render(canvas);
  }

  void update(double t) {

      if (puck.puckRect.contains(ghostGuy1.ghostRect.center)) {
        if (ghostGuy1.mode == Mode.normal) {
          puck.isOffScreen = true;
          if(!songPlayed) {
            Flame.audio.play('go.mp3');
            songPlayed = true;
          }
        }
        if (ghostGuy1.mode == Mode.blue)
          ghostGuy1.isOffScreen = true;
      }

      if (puck.puckRect.contains(ghostGuy2.ghostRect.center)) {
        if (ghostGuy2.mode == Mode.normal)
          puck.isOffScreen = true;
        if (ghostGuy2.mode == Mode.blue)
          ghostGuy2.isOffScreen = true;
      }

      timer++;
      if (timer % 30 == 0) {
        timer = 0;
        ghostGuy1.turn();
        ghostGuy2.turn();
      }

      if (puck.puckRect.contains(big.powerRect.center) && !big.isOffScreen){
        ghostGuy1.mode = Mode.blue;
        ghostGuy2.mode = Mode.blue;

        big.isOffScreen = true;
      }

      switch (pad.pressed) {
        case Buttons.left:
          puck.facing = Face.left;
        break;

        case Buttons.right:
          puck.facing = Face.right;
        break;

        case Buttons.down:
          puck.facing = Face.down;
        break;

        case Buttons.up:
          puck.facing = Face.up;
        break;
      }
      puck.update(t);
      ghostGuy1.update(t);
      ghostGuy2.update(t);
  }

  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;
  }

  void onTapDown(TapDownDetails d) {

    pad.onTapDown(d);

  }
}

enum Direction {
  left,
  right,
  up,
  down
}

enum State {
  inactive,
  active
}