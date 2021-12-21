import 'package:freezed_annotation/freezed_annotation.dart';

import 'player_type.dart';
import 'progress.dart';

part 'game_state.freezed.dart';

@freezed
class GameState with _$GameState {
  factory GameState(
    Map tiles, {
    @Default(PlayerType.CIRCLE) PlayerType currentPlayer,
    Progress? progress,
  }) = _GameState;
}
