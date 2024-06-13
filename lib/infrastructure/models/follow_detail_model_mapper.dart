import '../../domain/entities/index.dart';

class FollowDetailModelMapper {
  static FollowDetail fromJson(Map<String, dynamic> json) {
    return FollowDetail(
      fechaVenta: json['fechaVenta'],
      codigoSeguimiento: json['codigoSeguimiento'],
      matriculaVehiculo: json['matriculaVehiculo'],
      colorVehiculo: json['colorVehiculo'],
      modeloVehiculo: json['modeloVehiculo'],
      descripcionVehiculo: json['descripcionVehiculo'],
      marcaVehiculo: json['marcaVehiculo'],
      nombreServicio: json['nombreServicio'],
      descripcionServicio: json['descripcionServicio'],
      fechaIniSeguimiento: json['fechaIniSeguimiento'],
      fechaFinSeguimiento: json['fechaFinSeguimiento'],
      estadoSeguimiento: json['estadoSeguimiento'],
      descripcionSeguimiento: json['descripcionSeguimiento'],
    );
  }
}
