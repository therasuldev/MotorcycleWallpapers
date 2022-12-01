import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'network_event.dart';
part 'network_state.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  StreamSubscription? _subscription;
  NetworkBloc() : super(ConnectionInitial()) {
    on<ListenConnection>(_onListenConnection);
    on<ConnectionChanged>(_onConnectionChanged);
  }
   _onListenConnection(ListenConnection event, Emitter<NetworkState> emit) {
    try {
      _subscription = Connectivity().onConnectivityChanged.listen((status) {
        add(ConnectionChanged(status == ConnectivityResult.none
            ? ConnectionFailure()
            : ConnectionSuccess()));
      });
    } catch (e) {
      emit(ConnectionFailure());
    }
  }

   _onConnectionChanged(
      ConnectionChanged event, Emitter<NetworkState> emit) {
    try {
      emit(event.connection);
    } catch (e) {
      emit(ConnectionFailure());
    }
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
