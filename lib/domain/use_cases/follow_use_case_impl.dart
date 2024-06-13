import 'package:flutter_template/domain/entities/index.dart';
import 'package:flutter_template/domain/repositories/index.dart';
import 'package:flutter_template/domain/use_cases/index.dart';

class FollowUseCaseImpl implements FollowUseCase {
  final FollowRepository _followRepository;

  FollowUseCaseImpl(this._followRepository);

  @override
  Future<List<Follow>> getMyFollows(String codigo) async {
    return await _followRepository.getMyFollows(codigo);
  }
  
  @override
  Future<FollowDetail> getFollow(String idFollow) async {
    return await _followRepository.getFollow(idFollow);
  }

}