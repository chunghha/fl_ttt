import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/finished_state.enum.dart';
import '../pods/game.pod.dart';
import '../theme/colors.dart';
import '../widgets/tile.widget.dart';
import '../widgets/winner_dialog.dart';

class Board extends HookConsumerWidget {
  const Board({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _currentTiles = ref.watch(tilesPod);
    final _winnerState = ref.watch(progressPod);

    useValueChanged(_winnerState, (_, __) async {
      _winnerState!.maybeWhen(
        finished: (_w) => showWinner(context, _w),
        orElse: () => {},
      );
    });

    return Container(
      color: nordBlack,
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(12),
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        children: _currentTiles.entries
            .map(
              (_e) => ProviderScope(
                overrides: [
                  currentTile.overrideWithValue(MapEntry(_e.key, _e.value))
                ],
                child: TileWidget(currentTile),
              ),
            )
            .toList(),
      ),
    );
  }

  void showWinner(BuildContext context, FINISHED_STATE finishedState) {
    Future.delayed(
      const Duration(milliseconds: 600),
      () => showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (context) {
          return WinnerDialog(finishedState);
        },
      ),
    );
  }
}
