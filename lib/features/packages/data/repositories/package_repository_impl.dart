import 'package:jup/features/packages/data/datasources/package_remote_data_source.dart';
import 'package:jup/features/packages/domain/entities/package.dart';
import 'package:jup/features/packages/domain/repositories/package_repository.dart';

class PackageRepositoryImpl implements PackageRepository {
  final PackageRemoteDataSource remoteDataSource;

  PackageRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Package>> getAllPackages() async {
    // TODO: Implement error handling and data mapping
    return await remoteDataSource.getAllPackages();
  }

  @override
  Future<Package> getPackageDetails(String packageId) async {
    // TODO: Implement error handling and data mapping
    return await remoteDataSource.getPackageDetails(packageId);
  }
}
