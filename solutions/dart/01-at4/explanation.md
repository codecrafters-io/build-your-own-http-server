The entry point for your HTTP server implementation is in `bin/main.dart`.

Study and uncomment the relevant code: 

```dart
// Uncomment this to pass the first stage
var server = await HttpServer.bind(InternetAddress.anyIPv6, 4221);
await server.forEach((HttpRequest request) {
  request.response.close();
});
```

Push your changes to pass the first stage:

```
git add .
git commit -m "pass 1st stage" # any msg
git push origin master
```
