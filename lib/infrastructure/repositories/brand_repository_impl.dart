import 'package:flutter_template/domain/data_sources/index.dart';
import 'package:flutter_template/domain/entities/index.dart';
import 'package:flutter_template/domain/repositories/index.dart';

class BrandRepositoryImpl implements BrandRepository {
  final BrandDataSource _brandDataSource;

  BrandRepositoryImpl(this._brandDataSource);

  @override
  Future<List<Brand>> getBrands() async {
    try {
      final brands = await _brandDataSource.getBrands();
      return brands;
    } catch (e) {
      throw Exception('Error al obtener las marcas de los vehiculos');
    }
  }
}
