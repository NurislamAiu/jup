import 'package:jup/features/home/data/datasources/home_remote_data_source.dart';
import 'package:jup/features/home/domain/entities/moment.dart';
import 'package:jup/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Moment?> getNextMoment() {
    return remoteDataSource.getNextMoment();
  }
}
