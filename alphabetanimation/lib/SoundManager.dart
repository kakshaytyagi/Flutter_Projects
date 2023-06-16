import 'package:audioplayers/audioplayers.dart';

class SoundManager {
  static final player = AudioPlayer();

  static Future<void> playSoundForLetter(String letter) async {
    player.stop();
    await player.play(AssetSource("sounds/${letter.toLowerCase()}_sound.mp3"));
  }
}