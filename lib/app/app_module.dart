import 'package:flutter_modular/flutter_modular.dart';
import 'package:mottu/app/modules/resource/resource_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(Modular.initialRoute, module: ResourceModule()),
      ];
}
