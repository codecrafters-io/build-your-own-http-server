require "socket"

server = TCPServer.new("localhost", 4221)
client_socket, client_address = server.accept
