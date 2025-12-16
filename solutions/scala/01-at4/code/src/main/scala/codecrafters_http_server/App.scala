package codecrafters_http_server

import java.io.IOException
import java.net.ServerSocket

object Main extends App {
  try {
    val serverSocket = new ServerSocket(4221)

    // Since the tester restarts your program quite often, setting SO_REUSEADDR
    // ensures that we don't run into 'Address already in use' errors
    serverSocket.setReuseAddress(true)

    serverSocket.accept() // Wait for connection from client.
    println("accepted new connection")
  } catch {
    case e: IOException =>
      println(s"IOException: ${e.getMessage}")
  }
}
