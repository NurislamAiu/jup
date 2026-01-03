import 'package:jup/features/home/domain/entities/moment.dart';

abstract class HomeRepository {
  Future<Moment?> getNextMoment();
}
