import 'package:chat/core/domain/socket_connection_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketConnection {
  late Either<SocketConnectionFailure, IO.Socket> _socketResponse;
  bool isConnected = false;
  void connectSocket() {
    final IO.Socket _socket =
        IO.io("https://sleepy-atoll-06422.herokuapp.com", <String, dynamic>{
      "transport": ["websocket"],
      "autoConnect": false,
    });
    _socket.connect();
    _socket.onConnect((data) {
      print('connected');
    });
    _socket.onConnectError((data) => print('error ${data.toString()}'));
  }

  Either<SocketConnectionFailure, IO.Socket> get socket => _socketResponse;
}
