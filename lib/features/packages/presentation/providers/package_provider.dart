import 'package:flutter/material.dart';
import 'package:jup/features/packages/domain/entities/package.dart';
import 'package:jup/features/packages/domain/usecases/get_all_packages.dart';

enum PackageState { initial, loading, loaded, error }

class PackageProvider extends ChangeNotifier {
  final GetAllPackages getAllPackages;

  PackageProvider({required this.getAllPackages});

  PackageState _state = PackageState.initial;
  PackageState get state => _state;

  List<Package> _packages = [];
  List<Package> get packages => _packages;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  Future<void> fetchAllPackages() async {
    _state = PackageState.loading;
    notifyListeners();
    try {
      _packages = await getAllPackages();
      _state = PackageState.loaded;
    } catch (e) {
      _errorMessage = e.toString();
      _state = PackageState.error;
    }
    notifyListeners();
  }
}
