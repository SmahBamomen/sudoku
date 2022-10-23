import 'package:flutter/material.dart';
import 'package:sudoku_package/sudoku_game.dart';


class SudokuMainGame extends StatelessWidget {
  const SudokuMainGame({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sudoku Game',
      useInheritedMediaQuery: true,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const SudokuGame(title: 'Sudoku Game'),
    );
  }
}