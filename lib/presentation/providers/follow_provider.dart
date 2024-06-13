import 'package:flutter/material.dart';
import 'package:flutter_template/domain/entities/index.dart';
import 'package:flutter_template/domain/use_cases/index.dart';

class FollowProvider extends ChangeNotifier {
  final FollowUseCase _followUseCase;

  List<Follow> _followList = [];
  bool _isLoading = false;

  FollowProvider(this._followUseCase);

  bool get isLoading => _isLoading;
  List<Follow> get followList => _followList;

  Future<void> getMyFollows(String codigo) async {
    _isLoading = true;
    notifyListeners();
    try {
      _followList = await _followUseCase.getMyFollows(codigo);
    } catch (error) {
      throw Exception(
          'Ocurrió un error en el provider al obtener los seguimientos');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearResults() {
    _followList = [];
    notifyListeners();
  }
}
