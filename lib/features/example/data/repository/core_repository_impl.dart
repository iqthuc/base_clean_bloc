import 'package:base_clean_bloc/base/network/errors/error.dart';
import 'package:base_clean_bloc/base/network/errors/extension.dart';
import 'package:base_clean_bloc/features/example/data/remote/source/data_source.dart';
import 'package:base_clean_bloc/features/example/domain/repository/core_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entity/player/player_entity.dart';

@Injectable(as: ExampleRepo)
class ExampleRepoImpl implements ExampleRepo {
  ExampleRepoImpl(this._remoteDataSource);

  final DataSource _remoteDataSource;

  @override
  Future<Either<BaseError, List<PlayerEntity>>> getData({
    required int offset,
    required int limit,
  }) async {
    try {
      final result = await _remoteDataSource.getData(
        limit: limit,
        offset: offset,
      );
      return right(result.data ?? []);
    } on DioException catch (exception) {
      return left(exception.baseError);
    }
  }
}
