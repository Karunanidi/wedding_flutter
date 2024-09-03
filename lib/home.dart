import 'dart:io';

import 'package:flutter/material.dart';
import 'package:invitation/widgets/congratulation_gift.dart';
import 'package:invitation/widgets/credit.dart';
import 'package:invitation/widgets/custom_divider.dart';
import 'package:invitation/widgets/gallery.dart';
import 'package:invitation/widgets/introduction.dart';
import 'package:invitation/widgets/map.dart';
import 'package:invitation/widgets/welcome.dart';
import 'package:just_audio/just_audio.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final player = AudioPlayer();

  Future<void> loadSongs() async {
    try {
      await player.setAsset('assets/audio/wedding_music.mp3');
      player.setLoopMode(LoopMode.one);
      if (Platform.isAndroid) {
        await player.play();
      }
    } catch (e) {
      debugPrint('Error loading or playing audio: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    loadSongs();
  }

  @override
  void dispose() {
    super.dispose();
    player.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: GestureDetector(
        onVerticalDragUpdate: (details) async {
          await player.play();
        },
        child: const SingleChildScrollView(
          child: Column(
            children: [
              Welcome(),
              Introduction(),
              CustomDivider(),
              Gallery(),
              CustomDivider(),
              MapScreen(),
              CustomDivider(),
              CongratulationGift(),
              Credit()
            ],
          ),
        ),
      ),
    );
  }
}
