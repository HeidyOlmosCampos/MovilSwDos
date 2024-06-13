import 'package:flutter_template/domain/entities/index.dart';

abstract class BrandRepository {
  Future<List<Brand>> getBrands();
}
