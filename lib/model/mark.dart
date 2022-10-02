import 'package:tic_tac_toe/audio/sfx.dart';

import '../gen/assets.gen.dart';

enum Mark {
  zero,
  cross;

  String get iconPath {
    switch (this) {
      case Mark.cross:
        return Assets.icons.cross;
      case Mark.zero:
        return Assets.icons.zero;
    }
  }

  Sfx get sfx {
    switch (this) {
      case Mark.cross:
        return Sfx.drawX;
      case Mark.zero:
        return Sfx.drawO;
    }
  }

  /// Get complement Mark
  Mark get complement {
    switch (this) {
      case Mark.cross:
        return Mark.zero;
      case Mark.zero:
        return Mark.cross;
    }
  }
}
