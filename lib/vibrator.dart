import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:vibration/vibration.dart';
import 'package:flutter/services.dart';

class VibratorScreen extends StatefulWidget {
  const VibratorScreen({super.key});

  @override
  State<VibratorScreen> createState() => _VibratorScreenState();
}

class _VibratorScreenState extends State<VibratorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vibration Plugin example app'),
      ),
      body: Builder(
        builder: (BuildContext context) {
          return Center(
            child: Column(
              children: <Widget>[
                ElevatedButton(
                  child: const Text('Sounds'),
                  onPressed: () {
                    FlutterRingtonePlayer.play(
                      android: AndroidSounds.notification,
                      ios: IosSounds.glass,
                      looping: true,
                      asAlarm: false,
                      volume: 1,
                    );
                  },
                ),
                ElevatedButton(
                  child: const Text('Vibrate for default 100ms'),
                  onPressed: () async {
                    await Vibration.vibrate(duration: 100);
                  },
                ),
                ElevatedButton(
                  child: const Text('Vibrate for default 250ms'),
                  onPressed: () {
                    Vibration.vibrate(duration: 250);
                  },
                ),
                ElevatedButton(
                  child: const Text('Vibrate for default 500ms'),
                  onPressed: () {
                    Vibration.vibrate();
                  },
                ),
                ElevatedButton(
                  child: const Text('Vibrate for 1000ms'),
                  onPressed: () {
                    Vibration.vibrate(duration: 1000);
                  },
                ),
                ElevatedButton(
                  child: const Text('Vibrate with pattern'),
                  onPressed: () {
                    const snackBar = SnackBar(
                      content: Text(
                        'Pattern: wait 0.5s, vibrate 1s, wait 0.5s, vibrate 2s, wait 0.5s, vibrate 3s, wait 0.5s, vibrate 0.5s',
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    Vibration.vibrate(
                      pattern: [500, 1000, 500, 2000, 500, 3000, 500, 500],
                    );
                  },
                ),
                ElevatedButton(
                  child: const Text('Vibrate with pattern and amplitude'),
                  onPressed: () {
                    const snackBar = SnackBar(
                      content: Text(
                        'Pattern: wait 0.5s, vibrate 1s, wait 0.5s, vibrate 2s, wait 0.5s, vibrate 3s, wait 0.5s, vibrate 0.5s',
                      ),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    Vibration.vibrate(
                      pattern: [500, 1000, 500, 2000, 500, 3000, 500, 500],
                      intensities: [0, 128, 0, 255, 0, 64, 0, 255],
                    );
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
