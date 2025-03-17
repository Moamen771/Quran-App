import 'package:audioplayers/audioplayers.dart';

class RadioItem {
  final int id;
  final String name;
  final String url;

  RadioItem({required this.id, required this.name, required this.url});

  playSound() async {
    final player = AudioPlayer();
    await player.play(UrlSource(url));
  }
}
