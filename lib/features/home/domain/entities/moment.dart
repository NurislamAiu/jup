import 'package:jup/features/home/domain/entities/moment_status.dart';

class Moment {
  final String id;
  final String date;
  final String dressCode;
  final MomentStatus status;

  Moment({
    required this.id,
    required this.date,
    required this.dressCode,
    required this.status,
  });
}