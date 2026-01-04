import 'package:jup/features/packages/domain/entities/package.dart';
import 'package:jup/features/packages/domain/repositories/package_repository.dart';

class GetAllPackages {
  final PackageRepository repository;

  GetAllPackages(this.repository);

  Future<List<Package>> call() async {
    return await repository.getAllPackages();
  }
}
