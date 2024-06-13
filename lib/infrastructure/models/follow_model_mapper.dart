import '../../domain/entities/index.dart';

class FollowModelMapper {
  static Follow fromJson(Map<String, dynamic> json) {

    return Follow(
      idServicio: json['idServicio'],
      fechaInicioServicio: json['fechaInicioServicio'],
      fechaFinServicio: json['fechaFinServicio'],
      estadoServicio: json['estadoServicio'],
      nombreServicio: json['nombreServicio'],
      matriculaVehiculo: json['matriculaVehiculo']
    );
  }
}
