import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/gen/assets.gen.dart';

enum Sfx {
  drawX,
  drawO;

  /// Get path of audio for audio_players plugin
  String get audioPath {
    switch (this) {
      case Sfx.drawX:
        return _getPath(Assets.audio.sfx.drawX);
      case Sfx.drawO:
        return _getPath(Assets.audio.sfx.drawO);
    }
  }

  String _getPath(String path) {
    return path.replaceFirst(
      RegExp(Constants.audioPrefix),
      '',
    );
  }
}
