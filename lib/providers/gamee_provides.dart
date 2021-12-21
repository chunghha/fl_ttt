import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/game_state.dart';
import '../models/player_type.dart';
import '../models/progress.dart';
import '../models/tile.dart';
import 'game_state_notifier.dart';

final currentTile = Provider<MapEntry<Tile, PlayerType>>(
  (ref) => MapEntry(
    Tile(3, 3),
    PlayerType.EMPTY,
  ),
);

final gameState = StateNotifierProvider<GameStateNotifier, GameState>(
  (_) => GameStateNotifier(GameState({})),
);

final progress = Provider<Progress?>((ref) => ref.watch(gameState).progress);

final tiles =
    Provider<Map<dynamic, dynamic>>((ref) => ref.watch(gameState).tiles);
