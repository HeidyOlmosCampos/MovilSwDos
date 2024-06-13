import 'package:flutter_template/domain/entities/index.dart';

abstract class BrandUseCase {
  Future<List<Brand>> getBrands();
}