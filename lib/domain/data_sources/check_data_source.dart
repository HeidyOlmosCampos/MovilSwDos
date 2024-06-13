import 'package:flutter_template/domain/entities/index.dart';

abstract class CheckDataSource {
  Future<Check> checkImage(int idBrand, String urlImage);
}