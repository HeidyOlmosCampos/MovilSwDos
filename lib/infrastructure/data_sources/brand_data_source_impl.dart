import 'package:flutter_template/config/dio_config.dart';
import 'package:flutter_template/domain/data_sources/index.dart';
import 'package:flutter_template/domain/entities/index.dart';
import 'package:flutter_template/infrastructure/models/index.dart';

class BrandDataSourceImpl implements BrandDataSource {
  BrandDataSourceImpl();

  @override
  Future<List<Brand>> getBrands() async {
    try {
      final response = await DioConfig.dioWithoutAuthorization.get(
        '/obtenerMarcasVehiculo',
      );

      var data = response.data['data'];

      List<Brand> brands = [];

      for (var brandsJson in data) {
        brands.add(BrandModelMapper.fromJson(brandsJson));
      }

      return brands;
    } catch (e) {
      throw Exception('Error al obtener las marcas de los vehiculos');
    }
  }
}
