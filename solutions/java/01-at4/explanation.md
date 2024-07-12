The entry point for your HTTP server implementation is in `src/main/java/Main.java`.

Study and uncomment the relevant code: 

```java
// Uncomment this block to pass the first stage

try {
  ServerSocket serverSocket = new ServerSocket(4221);

  // Since the tester restarts your program quite often, setting SO_REUSEADDR
  // ensures that we don't run into 'Address already in use' errors
  serverSocket.setReuseAddress(true);

  serverSocket.accept(); // Wait for connection from client.
  System.out.println("accepted new connection");
} catch (IOException e) {
  System.out.println("IOException: " + e.getMessage());
}
```

Push your changes to pass the first stage:

```
git add .
git commit -m "pass 1st stage" # any msg
git push origin master
```
