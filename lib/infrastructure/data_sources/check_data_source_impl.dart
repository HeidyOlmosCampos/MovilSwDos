import 'package:dio/dio.dart';
import 'package:flutter_template/config/dio_config.dart';
import 'package:flutter_template/domain/data_sources/index.dart';
import 'package:flutter_template/domain/entities/index.dart';
import 'package:flutter_template/infrastructure/models/index.dart';

class CheckDataSourceImpl implements CheckDataSource {
  CheckDataSourceImpl();

  @override
  Future<Check> checkImage(int idBrand, String urlImage) async {
    try {
      var formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(urlImage),
        'idMarcaVehiculo': idBrand,
      });
      DioConfig.dioWithoutAuthorization.options.contentType = null;
      final response = await DioConfig.dioWithoutAuthorization.post(
        '/calcularPrecioPreinspeccion',
        data: formData,
      );

      var data = response.data['data'];

      Check check = CheckModelMapper.fromJson(data);

      return check;
    } catch (e) {
      throw Exception('Error al realizar la revision');
    }
  }
}
