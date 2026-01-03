import 'dart:async';
import 'package:flutter/material.dart';

class CountdownTimer extends StatefulWidget {
  final DateTime targetDate;
  const CountdownTimer({super.key, required this.targetDate});

  @override
  State<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  late Timer _timer;
  late Duration _remaining;

  @override
  void initState() {
    super.initState();
    _updateRemainingTime();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) => _updateRemainingTime());
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _updateRemainingTime() {
    if (!mounted) return;
    final now = DateTime.now();
    final remaining = widget.targetDate.difference(now);
    setState(() {
      _remaining = remaining > Duration.zero ? remaining : Duration.zero;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildTimeCard(context, _remaining.inDays, 'дней'),
        _buildTimeCard(context, _remaining.inHours.remainder(24), 'часов'),
        _buildTimeCard(context, _remaining.inMinutes.remainder(60), 'минут'),
        _buildTimeCard(context, _remaining.inSeconds.remainder(60), 'секунд'),
      ],
    );
  }

  Widget _buildTimeCard(BuildContext context, int value, String label) {
    return Expanded(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: [
            TextSpan(
              text: value.toString().padLeft(2, '0'),
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF323755),
              ),
            ),
            TextSpan(
              text: ' $label',
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
