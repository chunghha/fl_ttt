import 'package:flutter/material.dart';

import '../screen/circle_painter.dart';
import '../screen/cross_painter.dart';
import '../widgets/empty.widget.dart';
import '../widgets/player.widget.dart';
import 'tile.dart';

enum PLAYER_TYPE { circle, cross, empty }

extension PlayerTypeExtension on PLAYER_TYPE {
  CustomPainter? toPainter(AnimationController controller) {
    switch (this) {
      case PLAYER_TYPE.circle:
        return CirclePainter(controller.value);
      case PLAYER_TYPE.cross:
        return CrossPainter(controller.value);
      case PLAYER_TYPE.empty:
        return null;
    }
  }

  Widget toWidget(
    AnimationController controller,
    Tile tile,
  ) {
    switch (this) {
      case PLAYER_TYPE.circle:
      case PLAYER_TYPE.cross:
        return PlayerWidget(controller, this);
      case PLAYER_TYPE.empty:
        return EmptyWidget(tile);
    }
  }
}
