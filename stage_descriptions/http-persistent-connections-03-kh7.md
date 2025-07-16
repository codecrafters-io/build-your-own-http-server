In this stage, you'll add support for explicit connection closure using the `Connection: close` header.

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
2. Close the connection after the second request when `Connection: close` is present
3. Include the `Connection: close` header in the response when closing the connection

### Notes
- The `Connection: close` header indicates that the connection should be closed after the response
- The server should include the same header in its response
- After sending the response with `Connection: close`, the server should close the TCP connection