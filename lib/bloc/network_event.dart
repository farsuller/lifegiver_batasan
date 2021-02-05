
import 'package:lifegiver_batasan/bloc/network_state.dart';

abstract class NetworkEvent {}

class ListenConnection extends NetworkEvent {}

class ConnectionChanged extends NetworkEvent {
  NetworkState connection;
  ConnectionChanged(this.connection);
}