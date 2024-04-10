require "socket"

SERVER_HOST = "localhost"
SERVER_PORT = 4221

def start_server
  server = TCPServer.new(SERVER_HOST, SERVER_PORT)
  client_socket, client_address = server.accept
end

start_server
