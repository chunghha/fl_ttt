import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/finished_state.enum.dart';
import '../models/game_state.dart';
import '../models/player_type.enum.dart';
import '../models/progress.dart';
import '../models/tile.dart';

class GameStateNotifier extends StateNotifier<GameState> {
  GameStateNotifier(GameState state) : super(state) {
    final _tiles = <Tile, PLAYER_TYPE>{};

    for (var x = 0; x < 3; x++) {
      for (var y = 0; y < 3; y++) {
        _tiles.putIfAbsent(Tile(x, y), () => PLAYER_TYPE.empty);
      }
    }

    this.state = state.copyWith(tiles: _tiles);
  }

  void toggle(Tile tile) {
    state.tiles[tile] = state.currentPlayer;
    state = state.copyWith(
      currentPlayer: _nextPlayer(),
      progress: _determineProgress(),
      tiles: state.tiles.map((_k, _v) => MapEntry(_k, _v)),
    );
  }

  void reset() {
    state = state.copyWith(
      currentPlayer: PLAYER_TYPE.circle,
      progress: Progress.inProgress(),
      tiles: state.tiles.map((_k, _v) => MapEntry(_k, PLAYER_TYPE.empty)),
    );
  }

  Progress? _determineProgress() {
    final _finished = isFinished();

    return _finished == null ? state.progress : Progress.finished(_finished);
  }

  PLAYER_TYPE _nextPlayer() {
    return state.currentPlayer == PLAYER_TYPE.circle
        ? PLAYER_TYPE.cross
        : PLAYER_TYPE.circle;
  }

  FINISHED_STATE? isFinished() {
    if (_hasThreeInARow(PLAYER_TYPE.circle)) {
      return FINISHED_STATE.circle;
    }
    if (_hasThreeInARow(PLAYER_TYPE.cross)) {
      return FINISHED_STATE.cross;
    }
    if (state.tiles.entries
        .where((_e) => _e.value == PLAYER_TYPE.empty)
        .toList()
        .isEmpty) {
      return FINISHED_STATE.draw;
    }

    return null;
  }

  bool _hasThreeInARow(PLAYER_TYPE player) {
    final tiles = state.tiles.entries
        .where((_e) => _e.value == player)
        .map((_t) => _t.key)
        .toList();

    if (tiles.where((_e) => _e.y == _e.x).toList().length == 3) {
      return true; // \ as Tile(x: 0, y: 0), Tile(x: 1, y: 1), Tile(x: 2, y: 2)]
    }
    if (tiles.where((_e) => 2 - _e.y == _e.x).toList().length == 3) {
      return true; // / as [Tile(x: 0, y: 2), Tile(x: 1, y: 1), Tile(x: 2, y: 0)]
    }

    for (var i = 0; i < 3; i++) {
      if (tiles.where((_t) => _t.x == i).toList().length == 3) {
        // ignore: lines_longer_than_80_chars
        return true; // - like as [Tile(x: 1, y: 0), Tile(x: 1, y: 1), Tile(x: 1, y: 2)]
      }
      if (tiles.where((_t) => _t.y == i).toList().length == 3) {
        // ignore: lines_longer_than_80_chars
        return true; // | like as [Tile(x: 0, y: 0), Tile(x: 1, y: 0), Tile(x: 2, y: 0)]
      }
    }

    return false;
  }
}
