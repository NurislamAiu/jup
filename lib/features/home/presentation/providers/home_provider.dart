import 'package:flutter/material.dart';
import 'package:jup/features/home/domain/entities/moment.dart';
import 'package:jup/features/home/domain/usecases/get_next_moment.dart';

enum HomeState { initial, loading, loaded, error }

class HomeProvider with ChangeNotifier {
  final GetNextMoment getNextMoment;

  HomeProvider({required this.getNextMoment});

  HomeState _state = HomeState.initial;
  HomeState get state => _state;

  Moment? _moment;
  Moment? get moment => _moment;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  Future<void> fetchNextMoment() async {
    _state = HomeState.loading;
    notifyListeners();
    try {
      // The result can now be a Moment object or null.
      _moment = await getNextMoment();
      _state = HomeState.loaded;
    } catch (e) {
      _errorMessage = 'Не удалось загрузить данные. Попробуйте позже.';
      _state = HomeState.error;
    }
    notifyListeners();
  }
}
