import 'package:flutter/material.dart';

import '../models/player_type.enum.dart';
import '../theme/colors.dart';

class PlayerWidget extends StatelessWidget {
  final AnimationController controller;
  final PLAYER_TYPE player;

  const PlayerWidget(this.controller, this.player, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Container(
          color: nordBlue,
          child: CustomPaint(
            painter: player.toPainter(controller),
          ),
        );
      },
    );
  }
}
