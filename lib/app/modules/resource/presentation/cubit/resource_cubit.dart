import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mottu/app/core/use_case.dart';
import 'package:mottu/app/modules/resource/domain/usecases/get_battery_use_case.dart';
import 'package:mottu/app/modules/resource/domain/usecases/get_wifi_use_case.dart';

part 'resource_state.dart';

class ResourceCubit extends Cubit<ResourceState> {
  final GetBatteryUseCase _batteryUseCase;
  final GetWifiUseCase _wifiUseCase;

  ResourceCubit(
    this._batteryUseCase,
    this._wifiUseCase,
  ) : super(ResourceInitial());

  getBattery() async {
    emit(ResourceLoading());
    final result = await _batteryUseCase(const NoParams());

    result.fold((l) => null, (r) => emit(ResourceBattery(r.level)));
  }

  enableAndDisableWifi() async {
    emit(ResourceLoading());
    final result = await _wifiUseCase(const NoParams());

    result.fold((l) => null, (r) => emit(ResourceWifi(!r.isConnected)));
  }
}
