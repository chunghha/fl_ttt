// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/finished_state.dart';
import '../models/game_state.dart';
import '../models/player_type.dart';
import '../models/tile.dart';
import '../providers/game_state_notifier.dart';
import '../widgets/tile_widget.dart';
import '../widgets/winner_dialog.dart';

final _currentTile = ScopedProvider<MapEntry<Tile, PlayerType>>(null);
final _gameState = StateNotifierProvider<GameStateNotifier, GameState>(
    (_) => GameStateNotifier(GameState({})));
final _progress = Provider((ref) => ref.watch(_gameState).progress);
final _tiles = Provider((ref) => ref.watch(_gameState).tiles);

class Board extends HookWidget {
  @override
  Widget build(BuildContext context) {
    var currentTiles = useProvider(_tiles);
    var _winner = useProvider(_progress);
    useValueChanged(_winner, (_, __) async {
      _winner!.maybeWhen(
          finished: (winner) => showWinner(context, winner), orElse: () => {});
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
                ], child: TileWidget(_currentTile, _gameState)))
            .toList(),
      ),
    );
  }

  void showWinner(BuildContext context, FinishedState finishState) {
    Future.delayed(
        const Duration(milliseconds: 600),
        () => showDialog<void>(
            context: context,
            barrierDismissible: false, // user must tap button!
            builder: (context) {
              return WinnerDialog(finishState, _gameState);
            }));
  }
}
