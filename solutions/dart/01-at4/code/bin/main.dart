import 'dart:io';

void main() async {
  var serverSocket = await ServerSocket.bind('0.0.0.0', 4221);

  await for (var clientSocket in serverSocket) {
    print("Client connected");
  }
}
