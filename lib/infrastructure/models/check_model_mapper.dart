import '../../domain/entities/index.dart';

class CheckModelMapper {
  static Check fromJson(Map<String, dynamic> json) {

    return Check(
      nombreServicio: json['nombreServicio'],
      descripcionServicio: json['descripcionServicio'],
      precioEstimado: json['precioEstimado'],
    );
  }
}
