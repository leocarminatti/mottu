import 'package:dartz/dartz.dart';
import 'package:mottu/app/core/failure.dart';
import 'package:mottu/app/modules/resource/domain/entities/battery_entity.dart';
import 'package:mottu/app/modules/resource/domain/entities/wifi_entity.dart';

abstract class IResourcesRepository {
  Future<Either<Failure, BatteryEntity>> battery();
  Future<Either<Failure, WifiEntity>> wifi();
}
