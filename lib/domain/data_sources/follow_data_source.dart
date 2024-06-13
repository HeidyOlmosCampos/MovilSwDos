import 'package:flutter_template/domain/entities/index.dart';

abstract class FollowDataSource {
  Future<List<Follow>> getMyFollows(String codigo);
  Future<FollowDetail> getFollow(String idFollow);
}