The entry point for your HTTP server implementation is in `bin/main.dart`.

Study and uncomment the relevant code: 

```dart
// Uncomment this to pass the first stage
var serverSocket = await ServerSocket.bind('0.0.0.0', 4221);
await for (var clientSocket in serverSocket) {
  print("Client connected");
}
```

Push your changes to pass the first stage:

```
git add .
git commit -m "pass 1st stage" # any msg
git push origin master
```
