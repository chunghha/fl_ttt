import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/game_state.dart';
import '../models/player_type.dart';
import '../models/tile.dart';
import '../providers/game_state_notifier.dart';
import '../screen/circle_painter.dart';
import '../screen/cross_painter.dart';
import '../theme/colors.dart';

class TileWidget extends HookConsumerWidget {
  final Color _tileColor = nordBlue;
  final Duration _duration = const Duration(milliseconds: 500);
  final Provider<MapEntry<Tile, PlayerType>> _currentTile;
  final StateNotifierProvider<GameStateNotifier, GameState> _gameState;

  TileWidget(this._currentTile, this._gameState, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tileEntry = ref.watch(_currentTile);

    final _controller = useAnimationController(
      duration: _duration,
      lowerBound: 0,
      upperBound: 100,
      initialValue: 0,
    );

    useValueChanged(tileEntry.value, (_, __) async {
      tileEntry.value == PlayerType.EMPTY
          ? _controller.reset()
          : _controller.forward();
    });

    switch (tileEntry.value) {
      case PlayerType.CROSS:
      case PlayerType.CIRCLE:
        return paintPlayerWidget(_controller, tileEntry.value);
      case PlayerType.EMPTY:
        return emptyWidget(ref, context, tileEntry.key);
    }
  }

  Widget emptyWidget(WidgetRef ref, BuildContext context, Tile tile) {
    return GestureDetector(
      onTap: () => {ref.read(_gameState.notifier).toggle(tile)},
      child: Container(
        color: _tileColor,
      ),
    );
  }

  Widget paintPlayerWidget(
    AnimationController _controller,
    PlayerType _player,
  ) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          color: _tileColor,
          child: CustomPaint(
            painter: _player == PlayerType.CIRCLE
                ? CirclePainter(_controller.value)
                : CrossPainter(_controller.value),
          ),
        );
      },
    );
  }
}
