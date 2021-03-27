// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/finished_state.dart';
import '../models/game_state.dart';
import '../models/player_type.dart';
import '../models/tile.dart';
import '../providers/game_state_notifier.dart';
import '../theme/colors.dart';
import 'circle_painter.dart';
import 'cross_painter.dart';

final _currentTile = ScopedProvider<MapEntry<Tile, PlayerType>>(null);
final _gameState =
    StateNotifierProvider((_) => GameStateNotifier(GameState({})));
final _progress = Provider((ref) => ref.watch(_gameState.state).progress);
final _tiles = Provider((ref) => ref.watch(_gameState.state).tiles);
final _tileColor = nordBlue;

class Board extends HookWidget {
  @override
  Widget build(BuildContext context) {
    var currentTiles = useProvider(_tiles);
    var _winner = useProvider(_progress);
    useValueChanged(_winner, (_, __) async {
      _winner!.maybeWhen(
          finished: (winner) => triggerDialog(context, winner),
          orElse: () => {});
    });
    return Container(
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(12),
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        children: currentTiles.entries
            .map((entry) => ProviderScope(overrides: [
                  _currentTile
                      .overrideWithValue(MapEntry(entry.key, entry.value))
                ], child: TileWidget()))
            .toList(),
      ),
    );
  }

  void triggerDialog(BuildContext context, FinishedState finishState) {
    Future.delayed(
        const Duration(milliseconds: 600),
        () => showDialog<void>(
            context: context,
            barrierDismissible: false, // user must tap button!
            builder: (context) {
              return FinishDialog(finishState);
            }));
  }
}

class TileWidget extends HookWidget {
  const TileWidget({Key? key}) : super(key: key);
  final Duration duration = const Duration(milliseconds: 500);

  @override
  Widget build(BuildContext context) {
    final tileEntry = useProvider(_currentTile);
    final _controller = useAnimationController(
        duration: duration, lowerBound: 0, upperBound: 100, initialValue: 0);
    useValueChanged(tileEntry.value, (_, __) async {
      if (tileEntry.value == PlayerType.EMPTY) {
        _controller.reset();
      }
      if (tileEntry.value != PlayerType.EMPTY) {
        _controller.forward();
      }
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

class FinishDialog extends StatelessWidget {
  final FinishedState _winner;

  FinishDialog(this._winner);

  String subtitle() {
    if (_winner == FinishedState.CROSS) {
      return 'Cross won!';
    }
    if (_winner == FinishedState.CIRCLE) {
      return 'Circle won!';
    }
    return 'Neither has won!';
  }

  String title() {
    if (_winner == FinishedState.DRAW) {
      return 'Call it a draw!';
    }
    return 'We have a winner!';
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title()),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(subtitle()),
          ],
        ),
      ),
      actions: <Widget>[
        ElevatedButton(
          child: Text(
            'Play Again?',
            style: TextStyle(
              color: nordBrightWhite,
            ),
          ),
          onPressed: () {
            context.read(_gameState).reset();
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(primary: nordRed),
        ),
      ],
    );
  }
}
