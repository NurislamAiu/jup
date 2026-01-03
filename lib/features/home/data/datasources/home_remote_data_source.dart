import 'package:jup/features/home/domain/entities/moment.dart';
import 'package:jup/features/home/domain/entities/moment_status.dart';
import 'package:intl/intl.dart';

abstract class HomeRemoteDataSource {
  Future<Moment?> getNextMoment();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  @override
  Future<Moment?> getNextMoment() async {
    // Simulate a network delay
    await Future.delayed(const Duration(seconds: 1));

    // To test the empty state, return null.
    // To test the loaded state, return the Moment object.
    bool hasMoment = true; 

    if (hasMoment) {
      final momentDate = DateTime.now().add(const Duration(days: 3));
      final formattedDate = DateFormat('EEEE, MMMM d').format(momentDate);
      return Moment(
        id: 'mock_id_123',
        date: formattedDate,
        dressCode: 'Повседневный смарт-кэжуал',
        status: MomentStatus.preparing,
      );
    } else {
      return null;
    }
  }
}
