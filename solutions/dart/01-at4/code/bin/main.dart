import 'dart:io';

void main() async {
  var server = await HttpServer.bind(InternetAddress.anyIPv6, 4221);
  await server.forEach((HttpRequest request) {
    request.response.close();
  });
}
