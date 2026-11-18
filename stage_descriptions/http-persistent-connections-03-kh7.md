Your server now keeps connections open for reuse. In this stage, you'll honor
`Connection: close` by completing the response and then closing that TCP
connection.

### Closing a connection

The header signals that the client wants its current response to be the last on
that connection. Send the normal endpoint response before closing the socket.

### Tests

The tester will execute your program like this:

```bash
$ ./your_program.sh
```

The tester will send two requests:

1. A regular request that should keep the connection open
2. A request with `Connection: close` header that should close the connection

```bash
$ curl --http1.1 -v http://localhost:4221/echo/orange --next http://localhost:4221/ -H "Connection: close"
```

Your server must:

1. Keep the connection open after the first request
2. Send the complete second response, then close that TCP connection when
   `Connection: close` is present
3. Include the `Connection: close` header in the response when closing the
   connection

Closing this connection must not stop the listening server or close other
clients' connections. Requests without `Connection: close` retain the persistent
behavior from earlier stages.
