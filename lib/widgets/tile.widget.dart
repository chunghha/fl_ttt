import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/player_type.enum.dart';
import '../models/tile.dart';

class TileWidget extends HookConsumerWidget {
  final Duration _duration = const Duration(milliseconds: 500);
  final Provider<MapEntry<Tile, PLAYER_TYPE>> _currentTile;

  const TileWidget(this._currentTile, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tileEntry = ref.watch(_currentTile);

    final _controller = useAnimationController(
      duration: _duration,
      lowerBound: 0,
      upperBound: 100,
      initialValue: 0,
    );

    useValueChanged(tileEntry.value, (_, __) async {
      tileEntry.value == PLAYER_TYPE.empty
          ? _controller.reset()
          : _controller.forward();
    });

    return tileEntry.value.toWidget(_controller, tileEntry.key);
  }
}
