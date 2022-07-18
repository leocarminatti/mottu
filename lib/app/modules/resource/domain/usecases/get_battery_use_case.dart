import 'package:dartz/dartz.dart';
import 'package:mottu/app/core/failure.dart';
import 'package:mottu/app/core/use_case.dart';
import 'package:mottu/app/modules/resource/domain/entities/battery_entity.dart';
import 'package:mottu/app/modules/resource/domain/repositories/i_resources_repository.dart';

class GetBatteryUseCase implements UseCase<void, NoParams> {
  final IResourcesRepository repository;

  GetBatteryUseCase(this.repository);

  @override
  Future<Either<Failure, BatteryEntity>> call(NoParams params) async {
    return await repository.battery();
  }
}
