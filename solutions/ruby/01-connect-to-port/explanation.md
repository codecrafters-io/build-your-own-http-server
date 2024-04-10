The entry point for your HTTP server implementation is in `app/server.rb`.

Study and uncomment the relevant code: 

```ruby
# Uncomment this to pass the first stage

server = TCPServer.new(SERVER_HOST, SERVER_PORT)
client_socket, client_address = server.accept
```

Push your changes to pass the first stage:

```
git add .
git commit -m "pass 1st stage" # any msg
git push origin master
```
