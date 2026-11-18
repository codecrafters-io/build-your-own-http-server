Your server can handle clients and return responses. Reusing a TCP connection
avoids a new connection setup for every request. In this stage, you'll keep one
connection open and handle successive requests on it.

### Message boundaries on a reused connection

Persistent connections are the default behavior in HTTP/1.1.

Each request still needs its own response. Header values and paths belong to
that request, even when the connection is reused. The body lengths and CRLF
delimiters from earlier stages distinguish adjacent messages in the byte stream.

With an open connection, a client can't use disconnection to recognize the end
of a body. Continue sending accurate `Content-Length` values. For an empty `200`
response, such as `/`, `Content-Length: 0` makes the end explicit. TCP read
boundaries do not define HTTP message boundaries.

### Tests

The tester will execute your program like this:

```bash
$ ./your_program.sh
```

The tester will then send two sequential requests over the same connection:

```bash
$ curl --http1.1 -v http://localhost:4221/echo/banana --next http://localhost:4221/user-agent -H "User-Agent: blueberry/apple-blueberry"
```

Your server must:

1. Keep the TCP connection open after the first request
2. Handle any subsequent requests on the same connection
3. Return appropriate responses for both requests

### Notes

- HTTP/1.1 permits explicit closure through `Connection: close`. Handling that
  header comes in later stages.
- These requests are sequential: the client receives one response before sending
  the next. HTTP pipelining is outside this stage.
