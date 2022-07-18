import 'package:dartz/dartz.dart';
import 'package:mottu/app/core/failure.dart';
import 'package:mottu/app/core/use_case.dart';
import 'package:mottu/app/modules/resource/domain/entities/wifi_entity.dart';
import 'package:mottu/app/modules/resource/domain/repositories/i_resources_repository.dart';

class GetWifiUseCase implements UseCase<void, NoParams> {
  final IResourcesRepository repository;

  GetWifiUseCase(this.repository);

  @override
  Future<Either<Failure, WifiEntity>> call(NoParams params) async {
    return await repository.wifi();
  }
}
