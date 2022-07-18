import 'package:flutter/services.dart';
import 'package:mottu/app/core/app_keys.dart';
import 'package:mottu/app/core/failure.dart';
import 'package:mottu/app/core/method_channel_services.dart';
import 'package:mottu/app/modules/resource/infra/data_source/i_resources_data_source.dart';
import 'package:mottu/app/modules/resource/infra/model/battery_model.dart';
import 'package:mottu/app/modules/resource/infra/model/wifi_model.dart';

class ResourcesDataSource implements IResourcesDataSource {
  @override
  Future<BatteryModel> battery() async {
    try {
      return BatteryModel(
          await MethodChannelServices.platform.invokeMethod(AppKeys.battery));
    } on PlatformException catch (error) {
      throw GetBatteryInfoFailure(
          error.message ?? 'Informação da bateria não encontrada!');
    }
  }

  @override
  Future<WifiModel> wifi() async {
    try {
      return WifiModel(
          await MethodChannelServices.platform.invokeMethod(AppKeys.wifi));
    } on PlatformException catch (error) {
      throw AccessWifiFailure(error.message ?? 'Erro ao acessar o wifi!');
    }
  }
}
