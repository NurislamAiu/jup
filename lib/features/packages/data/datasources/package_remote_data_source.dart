import 'package:jup/features/packages/domain/entities/package.dart';

abstract class PackageRemoteDataSource {
  Future<List<Package>> getAllPackages();
  Future<Package> getPackageDetails(String packageId);
}

class PackageRemoteDataSourceImpl implements PackageRemoteDataSource {
  // TODO: Implement actual API calls here
  @override
  Future<List<Package>> getAllPackages() {
    throw UnimplementedError();
  }

  @override
  Future<Package> getPackageDetails(String packageId) {
    throw UnimplementedError();
  }
}
