part of'network_bloc.dart';

@immutable
abstract class NetworkEvent{}
class ListenConnection extends NetworkEvent {}

class ConnectionChanged extends NetworkEvent {
  final NetworkState connection;
  ConnectionChanged(this.connection);
}
