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
      if (!(previous?.finished ?? false)) {
        audioPlayer.playSfx(next.turn.complement.sfx);
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
            opacity: 0.1,
            child: buildBox(box),
          );
        }
      } else {
        return buildBox(box);
      }
    }

    return Scaffold(
      // backgroundColor: const Color(0xFFC9F9FC),
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
                    child: buildAnimatedBox(box, index, boardState.winCombo),
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
