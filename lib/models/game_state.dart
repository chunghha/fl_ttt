import 'package:freezed_annotation/freezed_annotation.dart';

import 'player_type.enum.dart';
import 'progress.dart';

part 'game_state.freezed.dart';

@freezed
class GameState with _$GameState {
  factory GameState(
    Map tiles, {
    @Default(PLAYER_TYPE.circle) PLAYER_TYPE currentPlayer,
    Progress? progress,
  }) = _GameState;
}
