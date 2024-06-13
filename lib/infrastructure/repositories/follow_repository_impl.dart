import 'package:flutter_template/domain/data_sources/index.dart';
import 'package:flutter_template/domain/entities/index.dart';
import 'package:flutter_template/domain/repositories/index.dart';

class FollowRepositoryImpl implements FollowRepository {
  final FollowDataSource _followDataSource;

  FollowRepositoryImpl(this._followDataSource);

  @override
  Future<List<Follow>> getMyFollows(String codigo) async {
    try {
      final follows = await _followDataSource.getMyFollows(codigo);
      return follows;
    } catch (e) {
      throw Exception('Error al obtener los seguimientos');
    }
  }
  
  @override
  Future<FollowDetail> getFollow(String idFollow) async {
    try {
      final followDetail = await _followDataSource.getFollow(idFollow);
      return followDetail;
    } catch (e) {
      throw Exception('Error al obtener los detalles del seguimiento');    }
  }
}
