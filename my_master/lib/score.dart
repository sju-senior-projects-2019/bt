import 'dart:ui';

import 'package:flame/components/text_component.dart';
import 'package:flame/text_config.dart';
import 'package:flame/anchor.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flame/palette.dart';

import 'package:my_master/MazeGame.dart';

class Score {
  final MazeGame game;
  TextConfig scoreConfig;

  Score(this.game) {
    scoreConfig = TextConfig(fontSize: 40.0,
        color: BasicPalette.white.color);
  }

  void render(Canvas c) {
  }

  void update(double t) {

  }

}