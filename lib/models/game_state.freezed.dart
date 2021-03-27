// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'game_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$GameStateTearOff {
  const _$GameStateTearOff();

  _GameState call(Map<dynamic, dynamic> tiles,
      {PlayerType currentPlayer = PlayerType.CIRCLE, Progress? progress}) {
    return _GameState(
      tiles,
      currentPlayer: currentPlayer,
      progress: progress,
    );
  }
}

/// @nodoc
const $GameState = _$GameStateTearOff();

/// @nodoc
mixin _$GameState {
  Map<dynamic, dynamic> get tiles => throw _privateConstructorUsedError;
  PlayerType get currentPlayer => throw _privateConstructorUsedError;
  Progress? get progress => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GameStateCopyWith<GameState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameStateCopyWith<$Res> {
  factory $GameStateCopyWith(GameState value, $Res Function(GameState) then) =
      _$GameStateCopyWithImpl<$Res>;
  $Res call(
      {Map<dynamic, dynamic> tiles,
      PlayerType currentPlayer,
      Progress? progress});

  $ProgressCopyWith<$Res>? get progress;
}

/// @nodoc
class _$GameStateCopyWithImpl<$Res> implements $GameStateCopyWith<$Res> {
  _$GameStateCopyWithImpl(this._value, this._then);

  final GameState _value;
  // ignore: unused_field
  final $Res Function(GameState) _then;

  @override
  $Res call({
    Object? tiles = freezed,
    Object? currentPlayer = freezed,
    Object? progress = freezed,
  }) {
    return _then(_value.copyWith(
      tiles: tiles == freezed
          ? _value.tiles
          : tiles // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>,
      currentPlayer: currentPlayer == freezed
          ? _value.currentPlayer
          : currentPlayer // ignore: cast_nullable_to_non_nullable
              as PlayerType,
      progress: progress == freezed
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as Progress?,
    ));
  }

  @override
  $ProgressCopyWith<$Res>? get progress {
    if (_value.progress == null) {
      return null;
    }

    return $ProgressCopyWith<$Res>(_value.progress!, (value) {
      return _then(_value.copyWith(progress: value));
    });
  }
}

/// @nodoc
abstract class _$GameStateCopyWith<$Res> implements $GameStateCopyWith<$Res> {
  factory _$GameStateCopyWith(
          _GameState value, $Res Function(_GameState) then) =
      __$GameStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Map<dynamic, dynamic> tiles,
      PlayerType currentPlayer,
      Progress? progress});

  @override
  $ProgressCopyWith<$Res>? get progress;
}

/// @nodoc
class __$GameStateCopyWithImpl<$Res> extends _$GameStateCopyWithImpl<$Res>
    implements _$GameStateCopyWith<$Res> {
  __$GameStateCopyWithImpl(_GameState _value, $Res Function(_GameState) _then)
      : super(_value, (v) => _then(v as _GameState));

  @override
  _GameState get _value => super._value as _GameState;

  @override
  $Res call({
    Object? tiles = freezed,
    Object? currentPlayer = freezed,
    Object? progress = freezed,
  }) {
    return _then(_GameState(
      tiles == freezed
          ? _value.tiles
          : tiles // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>,
      currentPlayer: currentPlayer == freezed
          ? _value.currentPlayer
          : currentPlayer // ignore: cast_nullable_to_non_nullable
              as PlayerType,
      progress: progress == freezed
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as Progress?,
    ));
  }
}

/// @nodoc
class _$_GameState implements _GameState {
  _$_GameState(this.tiles,
      {this.currentPlayer = PlayerType.CIRCLE, this.progress});

  @override
  final Map<dynamic, dynamic> tiles;
  @JsonKey(defaultValue: PlayerType.CIRCLE)
  @override
  final PlayerType currentPlayer;
  @override
  final Progress? progress;

  @override
  String toString() {
    return 'GameState(tiles: $tiles, currentPlayer: $currentPlayer, progress: $progress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GameState &&
            (identical(other.tiles, tiles) ||
                const DeepCollectionEquality().equals(other.tiles, tiles)) &&
            (identical(other.currentPlayer, currentPlayer) ||
                const DeepCollectionEquality()
                    .equals(other.currentPlayer, currentPlayer)) &&
            (identical(other.progress, progress) ||
                const DeepCollectionEquality()
                    .equals(other.progress, progress)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(tiles) ^
      const DeepCollectionEquality().hash(currentPlayer) ^
      const DeepCollectionEquality().hash(progress);

  @JsonKey(ignore: true)
  @override
  _$GameStateCopyWith<_GameState> get copyWith =>
      __$GameStateCopyWithImpl<_GameState>(this, _$identity);
}

abstract class _GameState implements GameState {
  factory _GameState(Map<dynamic, dynamic> tiles,
      {PlayerType currentPlayer, Progress? progress}) = _$_GameState;

  @override
  Map<dynamic, dynamic> get tiles => throw _privateConstructorUsedError;
  @override
  PlayerType get currentPlayer => throw _privateConstructorUsedError;
  @override
  Progress? get progress => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$GameStateCopyWith<_GameState> get copyWith =>
      throw _privateConstructorUsedError;
}
