import '../../domain/entities/index.dart';

class BrandModelMapper {
  static Brand fromJson(Map<String, dynamic> json) {

    return Brand(
      id: json['id'],
      nombre: json['nombre'],
      idERP: json['idERP'],
    );
  }
}
