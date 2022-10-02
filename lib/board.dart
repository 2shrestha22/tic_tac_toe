import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tic_tac_toe/ai.dart';
import 'package:tic_tac_toe/gen/assets.gen.dart';
import 'package:tic_tac_toe/sound/audio_controller.dart';

import 'mark.dart';

class Board extends StatefulHookConsumerWidget {
  const Board({super.key});

  @override
  ConsumerState<Board> createState() => _BoardState();
}

class _BoardState extends ConsumerState<Board> {
  @override
  Widget build(BuildContext context) {
    final boardState = ref.watch(aiProvider);
    final audioPlayer = ref.watch(audioControllerProvider.notifier);

    ref.listen(aiProvider, (previous, next) async {
      if (previous?.winner == null) {
        audioPlayer.playSfx(next.turn.complement.sfx);
      }

      if (next.winner != null) {
        alert(BuildContext context) => AlertDialog(
              content: Row(
                children: [
                  SvgPicture.asset(
                    next.winner!.iconPath,
                    width: 40,
                  ),
                  Text(
                    ' won',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Ok'),
                )
              ],
            );

        // showDialog(
        //   context: context,
        //   builder: (context) => alert(context),
        // ).then((value) => ref.refresh(aiProvider));
      }
    });

    buildBox(Mark? box) {
      return box == null
          ? SvgPicture.asset(Assets.icons.board)
          : SvgPicture.asset(box.iconPath);
    }

    buildAnimatedBox(Mark? box, int index, List<int>? winCombo) {
      if (winCombo != null) {
        if (winCombo.contains(index)) {
          return buildBox(box);
        } else {
          return Opacity(
            opacity: 0.5,
            child: buildBox(box),
          );
        }
      } else {
        return buildBox(box);
      }
    }

    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            if (boardState.finished) {
              ref.refresh(aiProvider);
            }
          },
          child: AbsorbPointer(
            absorbing: boardState.finished,
            child: AspectRatio(
              aspectRatio: 1.0,
              child: GridView.builder(
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemBuilder: (context, index) {
                  final box = boardState.marks[index];
                  return GestureDetector(
                    onTap: () {
                      ref.read(aiProvider.notifier).onMarkFill(index);
                    },
                    child: Center(
                      child: buildAnimatedBox(box, index, boardState.winCombo),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
