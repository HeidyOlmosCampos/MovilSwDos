import 'package:flutter_template/domain/entities/index.dart';

abstract class CheckUseCase {
  Future<Check> checkImage(int idBrand, String urlImage);
}