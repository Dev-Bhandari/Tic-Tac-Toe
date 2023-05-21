import 'package:flutter/material.dart';
import 'package:tic_tac_toe/model/tic_tac_toe.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  TicTacToe ticTacToe = TicTacToe();
  var _player = 1;
  var _winner = 0;
  String _str = "X turn";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_winner == 2) {
      _str = "Draw";
    } else if (_winner == 0) {
      if (_player == 1) {
        _str = "X turn";
      } else {
        _str = "O turn";
      }
    } else if (_winner == 1) {
      _str = "X Wins";
    } else if (_winner == -1) {
      _str = "O Wins";
    }
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(color: Colors.yellowAccent),
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Tic Tac Toe",
                    style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 40,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
            const Spacer(),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, crossAxisSpacing: 3, mainAxisSpacing: 3),
              itemCount: 9,
              itemBuilder: (context, index) {
                var row = (index / 3).floor();
                var column = index % 3;

                return InkWell(
                  onTap: () {
                    _winner != 3
                        ? _winner = ticTacToe.move(
                            player: _player, row: row, column: column)
                        : null;
                    _player = _player == 1 ? -1 : 1;

                    _winner != 3 ? setState(() {}) : null;
                  },
                  child: Container(
                    height: 30,
                    width: 30,
                    color: Colors.yellowAccent,
                    child: Center(
                      child: Text(
                        ticTacToe.getBoard(row: row, column: column) == 1
                            ? "X"
                            : ticTacToe.getBoard(row: row, column: column) == -1
                                ? "O"
                                : "",
                        style: const TextStyle(
                            fontSize: 50,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                );
              },
            ),
            const Spacer(),
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.yellowAccent),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    _str,
                    style: const TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 24,
                        fontWeight: FontWeight.w500),
                  ),
                )),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.yellowAccent,
              ),
              child: IconButton(
                onPressed: () {
                  ticTacToe.resetGame();
                  _player = 1;
                  _winner = 0;
                  setState(() {});
                },
                icon: const Icon(
                  Icons.refresh,
                  color: Colors.deepPurple,
                ),
                iconSize: 30,
              ),
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
