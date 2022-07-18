import 'package:flutter_modular/flutter_modular.dart';
import 'package:mottu/app/modules/resource/domain/repositories/i_resources_repository.dart';
import 'package:mottu/app/modules/resource/domain/usecases/get_battery_use_case.dart';
import 'package:mottu/app/modules/resource/domain/usecases/get_wifi_use_case.dart';
import 'package:mottu/app/modules/resource/external/resources_data_source.dart';
import 'package:mottu/app/modules/resource/infra/data_source/i_resources_data_source.dart';
import 'package:mottu/app/modules/resource/infra/repositories/resources_repository.dart';
import 'package:mottu/app/modules/resource/presentation/cubit/resource_cubit.dart';
import 'package:mottu/app/modules/resource/presentation/pages/resource_page.dart';

class ResourceModule extends Module {
  @override
  final List<Bind> binds = [
    Bind<IResourcesDataSource>((i) => ResourcesDataSource()),
    Bind<IResourcesRepository>((i) => ResourcesRepository(i())),
    Bind((i) => GetBatteryUseCase(i())),
    Bind((i) => GetWifiUseCase(i())),
    Bind((i) => ResourceCubit(i(), i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const ResourcePage()),
  ];
}
