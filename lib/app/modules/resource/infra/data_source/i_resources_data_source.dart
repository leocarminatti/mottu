import 'package:mottu/app/modules/resource/infra/model/battery_model.dart';
import 'package:mottu/app/modules/resource/infra/model/wifi_model.dart';

abstract class IResourcesDataSource {
  Future<BatteryModel> battery();
  Future<WifiModel> wifi();
}
