import 'dart:async';

import 'package:flutter/material.dart';

import 'package:global_school/configs/app_configs.dart';

/// A class that manages a timer for an audio player.
/// It provides functionality to start, pause, resume,
/// check if paused, reset, and dispose of the timer.
///
/// Additionally, it triggers a callback when the
/// audio has played for at least 5% of its duration.
class TimerController {
  // 10 percent

  /// Constructs a new [TimerController] object.
  /// [audioDuration] is the total duration of the audio.
  /// [onFivePercentReached] is a callback that will be invoked
  /// when the audio has played for at least 5% of its duration.
  TimerController(
    Duration audioDuration, {
    required this.callback,
  }) {
    start(audioDuration);
  }
  late StreamSubscription<int> _subscription;
  bool _hasReachedLimit = false;
  final VoidCallback callback;

  static const double _limit = 0.1;

  /// Starts the timer for the audio player.
  ///
  /// [audioDuration] is the total duration of the audio.
  void start(Duration audioDuration) {
    _subscription = Stream.periodic(
      AppConfigs.period,
      (i) => i,
    ).listen(
      (int value) {
        if (audioDuration != Duration.zero) {
          double percentagePlayed =
              (value * 1000) / audioDuration.inMilliseconds;

          if (percentagePlayed >= _limit && !_hasReachedLimit) {
            _hasReachedLimit = true;
            callback();
          }
        }
      },
    );
  }

  void pause() {
    _subscription.pause();
  }

  void resume() {
    _subscription.resume();
  }

  bool get isPaused => _subscription.isPaused;

  void reset() {
    _subscription.cancel();
    _hasReachedLimit = false;
  }

  void dispose() {
    _subscription.cancel();
  }
}
