import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/game_state.dart';
import '../models/player_type.enum.dart';
import '../models/progress.dart';
import '../models/tile.dart';
import 'game_state.notifier.dart';

final currentTile = Provider<MapEntry<Tile, PLAYER_TYPE>>(
  (ref) => MapEntry(
    Tile(3, 3),
    PLAYER_TYPE.empty,
  ),
);

final gameStatePod = StateNotifierProvider<GameStateNotifier, GameState>(
  (_) => GameStateNotifier(GameState({})),
);

final progressPod =
    Provider<Progress?>((ref) => ref.watch(gameStatePod).progress);

final tilesPod =
    Provider<Map<dynamic, dynamic>>((ref) => ref.watch(gameStatePod).tiles);
