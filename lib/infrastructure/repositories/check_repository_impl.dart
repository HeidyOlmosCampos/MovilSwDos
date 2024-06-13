import 'package:flutter_template/domain/data_sources/index.dart';
import 'package:flutter_template/domain/entities/index.dart';
import 'package:flutter_template/domain/repositories/index.dart';

class CheckRepositoryImpl implements CheckRepository {
  final CheckDataSource _checkDataSource;

  CheckRepositoryImpl(this._checkDataSource);

  @override
  Future<Check> checkImage(int idBrand, String urlImage) async {
    try {
      final check = await _checkDataSource.checkImage(idBrand, urlImage);
      return check;
    } catch (e) {
      throw Exception('Error al realizar la revisión del vehiculo');
    }
  }
}
