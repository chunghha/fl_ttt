import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/finished_state.enum.dart';
import '../pods/game.pod.dart';
import '../theme/colors.dart';

class WinnerDialog extends ConsumerWidget {
  final FINISHED_STATE _winner;

  const WinnerDialog(this._winner, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: Text(_winner.toTitle()),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(_winner.toSubtitle()),
          ],
        ),
      ),
      actions: <Widget>[
        ElevatedButton(
          child: Text(
            'Play Again?',
            style: TextStyle(
              color: nordBrightWhite,
            ),
          ),
          onPressed: () {
            ref.read(gameStatePod.notifier).reset();
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(primary: nordRed),
        ),
      ],
    );
  }
}
