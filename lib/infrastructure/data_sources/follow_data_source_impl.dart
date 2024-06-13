import 'package:flutter_template/config/dio_config.dart';
import 'package:flutter_template/domain/data_sources/index.dart';
import 'package:flutter_template/domain/entities/index.dart';
import 'package:flutter_template/infrastructure/models/index.dart';

class FollowDataSourceImpl implements FollowDataSource {
  FollowDataSourceImpl();

  @override
  Future<List<Follow>> getMyFollows(String codigo) async {
    try {
      codigo = codigo.trim();
      final response = await DioConfig.dioWithoutAuthorization.get(
        '/obtenerPorCodigoSeguimiento/$codigo',
      );

      var data = response.data['data'];

      List<Follow> follows = [];

      for (var brandsJson in data) {
        follows.add(FollowModelMapper.fromJson(brandsJson));
      }

      return follows;
    } catch (e) {
      throw Exception('Error al obtener los seguimientos de los vehiculos');
    }
  }

  @override
  Future<FollowDetail> getFollow(String idFollow) async {
    try {
      final response = await DioConfig.dioWithoutAuthorization.get(
        '/detalleSeguimientoServicio/$idFollow',
      );

      var data = response.data['data'];

      FollowDetail followDetail = FollowDetailModelMapper.fromJson(data);

      return followDetail;
    } catch (e) {
      throw Exception('Error al obtener el detalle del seguimiento');
    }
  }
}
