The entry point for your HTTP server implementation is in `src/main/kotlin/Main.kt`.

Study and uncomment the relevant code: 

```kotlin
// Uncomment this block to pass the first stage
var serverSocket = ServerSocket(4221)

// Since the tester restarts your program quite often, setting SO_REUSEADDR
// ensures that we don't run into 'Address already in use' errors
serverSocket.reuseAddress = true

serverSocket.accept() // Wait for connection from client.
println("accepted new connection")
```

Push your changes to pass the first stage:

```
git add .
git commit -m "pass 1st stage" # any msg
git push origin master
```
