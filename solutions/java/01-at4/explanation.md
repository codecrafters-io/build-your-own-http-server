The entry point for your HTTP server implementation is in `src/main/java/Main.java`.

Study and uncomment the relevant code: 

```java
// Uncomment this block to pass the first stage

ServerSocket serverSocket = null;
Socket clientSocket = null;

try {
  serverSocket = new ServerSocket(4221);
  serverSocket.setReuseAddress(true);
  clientSocket = serverSocket.accept(); // Wait for connection from client.
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
