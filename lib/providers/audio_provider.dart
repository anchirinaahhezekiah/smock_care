// lib/providers/audio_provider.dart
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class AudioProvider extends ChangeNotifier {
  FlutterTts _flutterTts = FlutterTts();
  bool _isPlaying = false;
  bool _isTtsEnabled = true;

  bool get isPlaying => _isPlaying;
  bool get isTtsEnabled => _isTtsEnabled;

  AudioProvider() {
    _initTts();
  }

  void _initTts() async {
    await _flutterTts.setLanguage("en-US");
    await _flutterTts.setSpeechRate(0.5);
    await _flutterTts.setVolume(0.8);
    await _flutterTts.setPitch(1.0);
  }

  Future<void> speak(String text) async {
    if (!_isTtsEnabled) return;

    _isPlaying = true;
    notifyListeners();

    await _flutterTts.speak(text);

    _isPlaying = false;
    notifyListeners();
  }

  Future<void> stop() async {
    await _flutterTts.stop();
    _isPlaying = false;
    notifyListeners();
  }

  void toggleTts() {
    _isTtsEnabled = !_isTtsEnabled;
    notifyListeners();
  }
}