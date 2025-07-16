In this stage, you'll add support for persistent HTTP connections. By default, HTTP/1.1 connections are persistent, meaning the same TCP connection can be reused for multiple requests.

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
- In HTTP/1.1, connections are persistent by default unless the client sends a `Connection: close` header
- Each request must be processed independently, even if they're on the same connection
- The server should not close the connection after each request