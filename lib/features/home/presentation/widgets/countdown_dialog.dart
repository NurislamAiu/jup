import 'package:flutter/material.dart';
import 'package:jup/features/home/presentation/widgets/countdown_timer.dart';

class CountdownDialog extends StatelessWidget {
  final DateTime targetDate;
  const CountdownDialog({super.key, required this.targetDate});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.close, color: Color(0xFF3D3632)),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            const Text(
              'До События',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF3D3632)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            CountdownTimer(targetDate: targetDate),
            const SizedBox(height: 24),
            Text(
              'Приготовьтесь к незабываемому моменту!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}
