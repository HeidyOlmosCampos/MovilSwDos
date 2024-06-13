import 'package:flutter_template/domain/entities/index.dart';
import 'package:flutter_template/domain/repositories/index.dart';
import 'package:flutter_template/domain/use_cases/index.dart';

class CheckUseCaseImpl implements CheckUseCase {
  final CheckRepository _checkRepository;

  CheckUseCaseImpl(this._checkRepository);

  @override
  Future<Check> checkImage(int idBrand, String urlImage) async {
    return await _checkRepository.checkImage(idBrand, urlImage);
  }

}