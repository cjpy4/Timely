
import 'package:flutter/material.dart';
import 'dart:async';

class EZtimer extends StatefulWidget {
  const EZtimer({
    super.key,
    this.width,
    this.height,
    required this.initialTime,
  });

  final double? width;
  final double? height;
  final int initialTime;

  @override
  EZtimerState createState() => EZtimerState();
}

class EZtimerState extends State<EZtimer> {
  static const countdownDuration = Duration(seconds: 10);
  Duration duration = const Duration();
  Timer? timer;

  bool isCountdown = false;

  @override
  void initState() {
    super.initState();
    duration = Duration(seconds: widget.initialTime);
  }

  void reset() {
    setState(() {
      if (isCountdown) {
        duration = countdownDuration;
      } else {
        duration = const Duration();
      }
    });
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) => addTime());
  }

  void stopTimer() {
    if (timer != null) {
      timer?.cancel();
      timer = null;
    }
  }

  void addTime() {
    final addSeconds = isCountdown ? -1 : 1;

    setState(() {
      final seconds = duration.inSeconds + addSeconds;
      if (seconds == -1) {
        timer?.cancel();
      } else {
        duration = Duration(seconds: seconds);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: widget.width,
        height: widget.height,
        child: Center(child: buildTime()));
  }

  Widget buildTime() {
    String twoDigits(int number) => number.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours.remainder(24));
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return Text(
      '$hours:$minutes:$seconds',
      style: Theme.of(context).textTheme.displayLarge,
    );
  }
}
