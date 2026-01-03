import 'package:jup/features/home/domain/entities/moment.dart';
import 'package:jup/features/home/domain/repositories/home_repository.dart';

class GetNextMoment {
  final HomeRepository repository;

  GetNextMoment(this.repository);

  Future<Moment?> call() {
    return repository.getNextMoment();
  }
}
