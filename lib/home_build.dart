import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motorcycle/app.dart';
import 'package:motorcycle/core/bloc/network/network_bloc.dart';

import 'view/use_case/no_network_widget.dart';

class HomeBuild {
  HomeBuild._();
  static Widget build() {
    return BlocBuilder<NetworkBloc, NetworkState>(
      builder: (context, state) {
        if (state is ConnectionSuccess) {
          return const MotorcycleApp();
        }
        if (state is ConnectionFailure) {
          return const NoInternet();
        }
        return const NoInternet();
      },
    );
  }
}
