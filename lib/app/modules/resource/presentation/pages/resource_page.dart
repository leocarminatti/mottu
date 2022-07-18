import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mottu/app/modules/resource/presentation/cubit/resource_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResourcePage extends StatelessWidget {
  const ResourcePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Modular.get<ResourceCubit>(),
      child: ResourcePageContent(),
    );
  }
}

class ResourcePageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Resource Page')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            _buildButtons(context),
            const Divider(),
            BlocBuilder<ResourceCubit, ResourceState>(
              builder: (context, state) {
                if (state is ResourceLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is ResourceBattery) {
                  return Text('${state.level} %');
                } else if (state is ResourceWifi) {
                  return Text(
                      'Wifi - ${state.isConnected ? 'Conectado' : 'Desconectado'}');
                }

                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }

  Column _buildButtons(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.green),
          ),
          onPressed: () {
            BlocProvider.of<ResourceCubit>(context).getBattery();
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Status Battery'),
              SizedBox(
                width: 20,
              ),
              Icon(
                Icons.battery_1_bar_sharp,
              )
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () {
            BlocProvider.of<ResourceCubit>(context).enableAndDisableWifi();
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Status Wifi'),
              SizedBox(
                width: 20,
              ),
              Icon(
                Icons.wifi,
              )
            ],
          ),
        )
      ],
    );
  }
}
