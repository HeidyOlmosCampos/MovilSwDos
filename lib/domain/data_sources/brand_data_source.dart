import 'package:flutter_template/domain/entities/index.dart';

abstract class BrandDataSource {
  Future<List<Brand>> getBrands();
}