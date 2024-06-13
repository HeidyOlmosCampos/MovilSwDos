import 'package:flutter/material.dart';
import 'package:flutter_template/domain/entities/follow_detail.dart';
import 'package:flutter_template/domain/entities/index.dart';
import 'package:flutter_template/domain/use_cases/index.dart';

class FollowDetailProvider extends ChangeNotifier {
  final FollowUseCase _followDetailUseCase;

  FollowDetail _followDetail = FollowDetail(
      fechaVenta: '',
      codigoSeguimiento: '',
      matriculaVehiculo: '',
      colorVehiculo: '',
      modeloVehiculo: '',
      descripcionVehiculo: '',
      marcaVehiculo: '',
      nombreServicio: '',
      descripcionServicio: '',
      fechaIniSeguimiento: '',
      fechaFinSeguimiento: '',
      estadoSeguimiento: '',
      descripcionSeguimiento: '');
  bool _isAddingCheck = false;

  FollowDetailProvider(this._followDetailUseCase);

  bool get isAddingCheck => _isAddingCheck;
  FollowDetail get followDetail => _followDetail;

  Future<FollowDetail> getFollow(String idFollow) async {
    _isAddingCheck = true;
    notifyListeners();
    try {
      _followDetail = await _followDetailUseCase.getFollow(idFollow);
      return _followDetail;
    } catch (e) {
      throw Exception(
          'Ocurrió un error en el provider al obtener el detalle del seguimiento');
    } finally {
      _isAddingCheck = false;
      notifyListeners();
    }
  }
}
