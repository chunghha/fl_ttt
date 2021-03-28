import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/finished_state.dart';
import '../models/game_state.dart';
import '../models/player_type.dart';
import '../models/progress.dart';
import '../models/tile.dart';

class GameStateNotifier extends StateNotifier<GameState> {
  GameStateNotifier(GameState state) : super(state) {
    var tiles = <Tile, PlayerType>{};
    for (var x = 0; x < 3; x++) {
      for (var y = 0; y < 3; y++) {
        tiles.putIfAbsent(Tile(x, y), () => PlayerType.EMPTY);
      }
    }
    this.state = state.copyWith(tiles: tiles);
  }

  void toggle(Tile tile) {
    state.tiles[tile] = state.currentPlayer;
    state = state.copyWith(
      currentPlayer: _nextPlayer(),
      progress: _determineProgress(),
      tiles: state.tiles.map((key, value) => MapEntry(key, value)),
    );
  }

  void reset() {
    state = state.copyWith(
        currentPlayer: PlayerType.CIRCLE,
        progress: Progress.inProgress(),
        tiles:
            state.tiles.map((key, value) => MapEntry(key, PlayerType.EMPTY)));
  }

  Progress? _determineProgress() {
    var _finished = isFinished();
    return _finished == null ? state.progress : Progress.finished(_finished);
  }

  PlayerType _nextPlayer() {
    return state.currentPlayer == PlayerType.CIRCLE
        ? PlayerType.CROSS
        : PlayerType.CIRCLE;
  }

  FinishedState? isFinished() {
    if (_hasThreeInARow(PlayerType.CIRCLE)) {
      return FinishedState.CIRCLE;
    }
    if (_hasThreeInARow(PlayerType.CROSS)) {
      return FinishedState.CROSS;
    }
    if (state.tiles.entries
        .where((element) => element.value == PlayerType.EMPTY)
        .toList()
        .isEmpty) {
      return FinishedState.DRAW;
    }
    return null;
  }

  bool _hasThreeInARow(PlayerType player) {
    var tiles = state.tiles.entries
        .where((element) => element.value == player)
        .map((e) => e.key)
        .toList();

    if (tiles.where((element) => element.y == element.x).toList().length == 3) {
      return true; // \ as Tile(x: 0, y: 0), Tile(x: 1, y: 1), Tile(x: 2, y: 2)]
    }
    if (tiles.where((element) => 2 - element.y == element.x).toList().length ==
        3) {
      return true; // / as [Tile(x: 0, y: 2), Tile(x: 1, y: 1), Tile(x: 2, y: 0)]
    }
    for (var i = 0; i < 3; i++) {
      if (tiles.where((tile) => tile.x == i).toList().length == 3) {
        // ignore: lines_longer_than_80_chars
        return true; // - like as [Tile(x: 1, y: 0), Tile(x: 1, y: 1), Tile(x: 1, y: 2)]
      }
      if (tiles.where((tile) => tile.y == i).toList().length == 3) {
        // ignore: lines_longer_than_80_chars
        return true; // | like as [Tile(x: 0, y: 0), Tile(x: 1, y: 0), Tile(x: 2, y: 0)]
      }
    }
    return false;
  }
}
