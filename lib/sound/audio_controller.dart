import 'package:audioplayers/audioplayers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tic_tac_toe/const.dart';
import 'package:tic_tac_toe/sound/sfx.dart';

final audioControllerProvider =
    StateNotifierProvider<AudioController, bool>((_) => AudioController(true));

/// State of sound truen when sound is not else false.
class AudioController extends StateNotifier<bool> {
  AudioController(super.state) {
    _audioCache = AudioCache(
      prefix: Values.audioPrefix,
    );
  }

  /// For games caching sfx is must
  late AudioCache _audioCache;

  late List<AudioPlayer> _sfxPlayers;

  /// Initialize Audio player.
  Future<void> initialize() async {
    await _audioCache.loadAll(
      Sfx.values.map((e) {
        return e.audioPath;
      }).toList(),
    );

    _sfxPlayers = Sfx.values
        .map(
          (e) => AudioPlayer(playerId: e.name)
            // ..audioCache = _audioCache
            ..setPlayerMode(PlayerMode.lowLatency),
        )
        .toList(growable: false);
  }

  void playSfx(Sfx sfx) {
    _sfxPlayers
        .firstWhere((e) => e.playerId == sfx.name)
        .play(AssetSource(sfx.audioPath));
  }

  @override
  void dispose() async {
    for (var player in _sfxPlayers) {
      await player.dispose();
    }
    super.dispose();
  }
}
