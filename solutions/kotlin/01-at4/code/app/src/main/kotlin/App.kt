import java.net.ServerSocket;

fun main() {
    var serverSocket = ServerSocket(4221)

    // Since the tester restarts your program quite often, setting SO_REUSEADDR
    // ensures that we don't run into 'Address already in use' errors
    serverSocket.reuseAddress = true

    serverSocket.accept() // Wait for connection from client.
    println("accepted new connection")
}
