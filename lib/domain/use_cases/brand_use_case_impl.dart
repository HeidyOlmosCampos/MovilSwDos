import 'package:flutter_template/domain/entities/index.dart';
import 'package:flutter_template/domain/repositories/index.dart';
import 'package:flutter_template/domain/use_cases/index.dart';

class BrandUseCaseImpl implements BrandUseCase {
  final BrandRepository _brandRepository;

  BrandUseCaseImpl(this._brandRepository);

  @override
  Future<List<Brand>> getBrands() async {
    return await _brandRepository.getBrands();
  }

}