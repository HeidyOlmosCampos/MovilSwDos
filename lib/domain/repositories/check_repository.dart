import 'package:flutter_template/domain/entities/index.dart';

abstract class CheckRepository {
  Future<Check> checkImage(int idBrand, String urlImage);
}
