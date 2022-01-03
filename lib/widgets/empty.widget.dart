import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/tile.dart';
import '../pods/game.pod.dart';
import '../theme/colors.dart';

class EmptyWidget extends ConsumerWidget {
  final Tile tile;

  const EmptyWidget(this.tile, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => ref.read(gameStatePod.notifier).toggle(tile),
      child: Container(
        color: nordBlue,
      ),
    );
  }
}
