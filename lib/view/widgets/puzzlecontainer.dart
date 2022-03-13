import 'package:flutter/material.dart';
import 'package:game/view/widgets/time_view.dart';
import 'package:game/view_models/providers/puzzle_game_provider.dart';
import 'package:provider/provider.dart';

class PuzzleContainer extends StatelessWidget {
  const PuzzleContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [TimerView(), PuzzleBox()],
    );
  }
}

class PuzzleBox extends StatefulWidget {
  const PuzzleBox({Key? key}) : super(key: key);

  @override
  State<PuzzleBox> createState() => _PuzzleBoxState();
}

class _PuzzleBoxState extends State<PuzzleBox> {
  @override
  Widget build(BuildContext context) {
    // context.read<PuzzleProvider>().changeboxsize(getWidth(context) * 0.08);
    return Container(
      width: (context.watch<PuzzleProvider>().getboxsize + 10) * 4,
      height: (context.watch<PuzzleProvider>().getboxsize + 10) * 4.5,
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      // color: Colors.amber,
      child: Stack(
        children: context.watch<PuzzleProvider>().getPieces,
      ),
    );
  }
}
