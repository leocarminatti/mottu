import 'package:dartz/dartz.dart';
import 'package:mottu/app/core/failure.dart';
import 'package:mottu/app/modules/resource/domain/entities/battery_entity.dart';
import 'package:mottu/app/modules/resource/domain/entities/wifi_entity.dart';
import 'package:mottu/app/modules/resource/domain/repositories/i_resources_repository.dart';
import 'package:mottu/app/modules/resource/infra/data_source/i_resources_data_source.dart';

class ResourcesRepository implements IResourcesRepository {
  final IResourcesDataSource dataSource;

  ResourcesRepository(this.dataSource);

  @override
  Future<Either<Failure, BatteryEntity>> battery() async {
    try {
      return right(await dataSource.battery());
    } on CacheFailure catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, WifiEntity>> wifi() async {
    try {
      return right(await dataSource.wifi());
    } on CacheFailure catch (e) {
      return left(Failure(e.message));
    }
  }
}
