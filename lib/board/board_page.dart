import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tic_tac_toe/board/board_state_notifier.dart';
import 'package:tic_tac_toe/gen/assets.gen.dart';
import 'package:tic_tac_toe/sound/audio_controller.dart';

import '../mark.dart';

class BoardPage extends HookConsumerWidget {
  const BoardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final boardState = ref.watch(boardProvider);
    final audioPlayer = ref.watch(audioControllerProvider.notifier);

    ref.listen(boardProvider, (previous, next) async {
      if (!(previous?.finished ?? false)) {
        audioPlayer.playSfx(next.turn.complement.sfx);
      }
    });

    buildBox(Mark? box) {
      return box == null
          ? const SizedBox.shrink()
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: GestureDetector(
            onTap: () {
              if (boardState.finished) {
                ref.refresh(boardProvider);
              }
            },
            child: AbsorbPointer(
              absorbing: boardState.finished,
              child: AspectRatio(
                aspectRatio: 1.0,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    SvgPicture.asset(
                      Assets.icons.grid,
                      color: const Color(0xFFDEE0E2),
                    ),
                    GridView.builder(
                      itemCount: 9,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      itemBuilder: (context, index) {
                        final box = boardState.marks[index];
                        return GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            ref.read(boardProvider.notifier).onMarkFill(index);
                          },
                          child:
                              buildAnimatedBox(box, index, boardState.winCombo),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
