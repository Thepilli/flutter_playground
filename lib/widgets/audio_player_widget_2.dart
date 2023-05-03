import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioPlayerScreen extends StatefulWidget {
  const AudioPlayerScreen({super.key});

  @override
  State<AudioPlayerScreen> createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  // late AudioPlayer player;

  // @override
  // void initState() {
  //   super.initState();
  //   player = AudioPlayer()..setSourceAsset('assets/audio.mp3');
  // }

  // @override
  // void dispose() {
  //   player.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Audio Player'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  final player = AudioPlayer();
                  player.play(AssetSource('audio.mp3'));
                },
                child: const Text('Play'),
              ),
              ElevatedButton(
                onPressed: () {
                  final player = AudioPlayer();
                  player.stop();
                },
                child: const Text('stop'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
