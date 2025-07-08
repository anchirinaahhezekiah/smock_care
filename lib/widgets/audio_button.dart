
// lib/widgets/audio_button.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/audio_provider.dart';

class AudioButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color? color;
  final double size;

  const AudioButton({
    Key? key,
    required this.onPressed,
    this.color,
    this.size = 24,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AudioProvider>(
      builder: (context, audioProvider, child) {
        return IconButton(
          onPressed: audioProvider.isPlaying ? null : onPressed,
          icon: Icon(
            audioProvider.isPlaying ? Icons.volume_up : Icons.volume_off,
            color: color ?? Colors.white,
            size: size,
          ),
        );
      },
    );
  }
}