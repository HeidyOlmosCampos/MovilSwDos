import 'package:flutter/material.dart';
import 'package:flutter_template/domain/entities/index.dart';
import 'package:flutter_template/domain/use_cases/index.dart';

class CheckProvider extends ChangeNotifier {
  final CheckUseCase _checkUseCase;

  Check _check =
      Check(nombreServicio: '', descripcionServicio: '', precioEstimado: '');
  bool _isAddingCheck = false;

  CheckProvider(this._checkUseCase);

  bool get isAddingCheck => _isAddingCheck;
  Check get check => _check;

  Future<Check> checkImage(int idBrand, String urlImage) async {
    _isAddingCheck = true;
    notifyListeners();
    try {
      _check = await _checkUseCase.checkImage(idBrand, urlImage);
      return check;
    } catch (e) {
      throw Exception(
          'Ocurrió un error en el provider al realizar la revision del vehiculo');
    } finally {
      _isAddingCheck = false;
      notifyListeners();
    }
  }
}
