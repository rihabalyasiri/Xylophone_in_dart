import 'package:flutter/material.dart';
import 'package:sound_library/sound_library.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Xylophone"),
        ),
        body: const SafeArea(child: Instrument()),
      ),
    );
  }
}

class Instrument extends StatelessWidget {
  const Instrument({super.key});

  void playWave(int waveNumber) {
    SoundPlayer.i.playLocal("note$waveNumber.wav");
  }

  Expanded buildKey({color, waveNumber}) {
    return Expanded(
        child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(color),
      ),
      onPressed: () {
        playWave(waveNumber);
      },
      child: null,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        buildKey(color: Colors.redAccent, waveNumber: 1),
        buildKey(color: Colors.tealAccent, waveNumber: 2),
        buildKey(color: Colors.lightBlue, waveNumber: 3),
        buildKey(color: Colors.purple, waveNumber: 4),
        buildKey(color: Colors.yellowAccent, waveNumber: 5),
        buildKey(color: Colors.black12, waveNumber: 6),
        buildKey(color: Colors.deepOrange, waveNumber: 7),
      ],
    );
  }
}
