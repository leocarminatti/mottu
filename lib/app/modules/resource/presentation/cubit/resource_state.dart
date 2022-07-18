part of 'resource_cubit.dart';

@immutable
abstract class ResourceState {}

class ResourceInitial extends ResourceState {}

class ResourceLoading extends ResourceState {}

class ResourceBattery extends ResourceState {
  final int level;

  ResourceBattery(this.level);
}

class ResourceWifi extends ResourceState {
  final bool isConnected;

  ResourceWifi(this.isConnected);
}
