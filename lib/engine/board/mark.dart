import '../../audio/sfx.dart';
import '../../gen/assets.gen.dart';

enum Mark {
  zero,
  cross;

  /// Get complement Mark
  Mark get complement {
    switch (this) {
      case Mark.cross:
        return Mark.zero;
      case Mark.zero:
        return Mark.cross;
    }
  }

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

  @override
  String toString() {
    switch (this) {
      case Mark.cross:
        return 'X';
      case Mark.zero:
        return 'O';
    }
  }
}
