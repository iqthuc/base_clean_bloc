import 'package:base_clean_bloc/base/network/errors/error.dart';
import 'package:base_clean_bloc/features/example/domain/entity/player/player_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ExampleRepo {
  Future<Either<BaseError, List<PlayerEntity>>> getData({
    required int offset,
    required int limit,
  });
}
