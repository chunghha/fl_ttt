import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/player_type.dart';
import '../models/tile.dart';
import '../providers/game_state_notifier.dart';
import '../screen/circle_painter.dart';
import '../screen/cross_painter.dart';
import '../theme/colors.dart';

class TileWidget extends HookWidget {
  final Color _tileColor = nordBlue;
  final Duration _duration = const Duration(milliseconds: 500);
  final ScopedProvider<MapEntry<Tile, PlayerType>> _currentTile;
  final StateNotifierProvider<GameStateNotifier> _gameState;

  TileWidget(this._currentTile, this._gameState);

  @override
  Widget build(BuildContext context) {
    final tileEntry = useProvider(_currentTile);
    final _controller = useAnimationController(
        duration: _duration, lowerBound: 0, upperBound: 100, initialValue: 0);
    useValueChanged(tileEntry.value, (_, __) async {
      tileEntry.value == PlayerType.EMPTY
          ? _controller.reset()
          : _controller.forward();
    });

    switch (tileEntry.value) {
      case PlayerType.CROSS:
        return crossWidget(_controller);
      case PlayerType.CIRCLE:
        return circleWidget(_controller);
      case PlayerType.EMPTY:
        return emptyWidget(context, tileEntry.key);
    }
  }

  Widget emptyWidget(BuildContext context, Tile tile) {
    return GestureDetector(
        onTap: () => {context.read(_gameState).toggle(tile)},
        child: Container(
          color: _tileColor,
        ));
  }

  Widget crossWidget(AnimationController _controller) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            color: _tileColor,
            child: CustomPaint(
              painter: CrossPainter(_controller.value),
            ),
          );
        });
  }

  Widget circleWidget(AnimationController _controller) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            color: _tileColor,
            child: CustomPaint(
              painter: CirclePainter(_controller.value),
            ),
          );
        });
  }
}
