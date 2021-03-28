import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'screen/board.dart';
import 'theme/colors.dart';
import 'theme/nord.dart';

void main() {
  runApp(ProviderScope(child: TicTacToe()));
}

class TicTacToe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: nordDarkTheme,
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: nordRed,
            centerTitle: true,
            title: Text("Tic Tac Toe"),
          ),
          body: Board()),
    );
  }
}
