import 'package:just_audio_background/just_audio_background.dart';
import 'package:just_audio/just_audio.dart';
import 'package:ringtones_flutter/src/domain/models/position_data.dart';
import 'package:ringtones_flutter/src/presentation/pages/home_page/home_controller.dart';
import 'package:rxdart/rxdart.dart';

late AudioPlayer _audioPlayer;

Future<void> initAudioServices() async {
  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.audio.flutter',
    androidNotificationChannelName: 'flutter_audio',
    androidNotificationOngoing: true,
  );
}

Future<void> initAdudioPlayer({
  required String urlAudio,
  required String urlImage,
  required int index,
  required String name,
}) async {
  _audioPlayer = AudioPlayer();

  final playlist = ConcatenatingAudioSource(
    children: [
      AudioSource.uri(
        Uri.parse(urlAudio),
        tag: MediaItem(
          id: '$index',
          album: name,
          title: name,
          displayTitle: name,
          artUri: Uri.parse(urlImage),
        ),
      ),
    ],
  );

  try {
    await _audioPlayer.setAudioSource(playlist);
  } catch (e) {
    throw e.toString();
  }
}

void play({required HomeController homeController}) {
  _audioPlayer.play();
  _audioPlayer.playerStateStream.listen((playerState) async {
    if (playerState.processingState == ProcessingState.completed &&
        homeController.isPlaying.value == true) {
      homeController.isPlaying(false);
      homeController.isFinish(true);
      replay();
      _audioPlayer.stop();
    }
  });
}

void replay() {
  _audioPlayer.seek(Duration.zero);
}

void pause() {
  _audioPlayer.pause();
}

void stop() {
  _audioPlayer.stop();
}

void exit() {
  _audioPlayer.dispose();
}

Future<bool> isPlaying() async {
  return _audioPlayer.playing;
}

void seek(Duration position) => _audioPlayer.seek(position);

Stream<PositionData> get positionDataStream =>
    Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
        _audioPlayer.positionStream,
        _audioPlayer.bufferedPositionStream,
        _audioPlayer.durationStream,
        (position, bufferedPosition, duration) => PositionData(
            position, bufferedPosition, duration ?? Duration.zero));
