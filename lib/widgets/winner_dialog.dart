import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/finished_state.dart';
import '../models/game_state.dart';
import '../providers/game_state_notifier.dart';
import '../theme/colors.dart';

class WinnerDialog extends StatelessWidget {
  final FinishedState _winner;
  final StateNotifierProvider<GameStateNotifier, GameState> _gameState;

  WinnerDialog(this._winner, this._gameState);

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
            context.read(_gameState.notifier).reset();
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(primary: nordRed),
        ),
      ],
    );
  }
}
