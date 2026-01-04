import 'package:jup/features/packages/domain/entities/package.dart';

abstract class PackageRepository {
  Future<List<Package>> getAllPackages();
  Future<Package> getPackageDetails(String packageId);
}
