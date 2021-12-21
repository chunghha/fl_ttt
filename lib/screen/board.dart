import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/finished_state.dart';
import '../providers/gamee_provides.dart';
import '../theme/colors.dart';
import '../widgets/tile_widget.dart';
import '../widgets/winner_dialog.dart';

class Board extends HookConsumerWidget {
  const Board({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _currentTiles = ref.watch(tiles);
    final _winner = ref.watch(progress);

    useValueChanged(_winner, (_, __) async {
      _winner!.maybeWhen(
        finished: (winner) => showWinner(context, winner),
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
              (entry) => ProviderScope(
                overrides: [
                  currentTile
                      .overrideWithValue(MapEntry(entry.key, entry.value))
                ],
                child: TileWidget(currentTile, gameState),
              ),
            )
            .toList(),
      ),
    );
  }

  void showWinner(BuildContext context, FinishedState finishState) {
    Future.delayed(
      const Duration(milliseconds: 600),
      () => showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (context) {
          return WinnerDialog(finishState, gameState);
        },
      ),
    );
  }
}
