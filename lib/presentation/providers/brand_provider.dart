import 'package:flutter/material.dart';
import 'package:flutter_template/domain/entities/index.dart';
import 'package:flutter_template/domain/use_cases/index.dart';

class BrandProvider extends ChangeNotifier {
  final BrandUseCase _brandUseCase;

  List<Brand> _brandList = [];
  bool _isLoading = false;
  bool _isLoadingNewBrands = false;

  BrandProvider(this._brandUseCase) {
    getBrands();
  }

  bool get isLoading => _isLoading;
  bool get isLoadingNewBrands => _isLoadingNewBrands;
  List<Brand> get brandList => _brandList;

  Future<void> getBrands() async {
    _isLoading = true;
    notifyListeners();
    try {
      _brandList = await _brandUseCase.getBrands();
    } catch (error) {
      throw Exception(
          'Ocurrio un error en el provider al obtener las marcas de los vehiculos');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
