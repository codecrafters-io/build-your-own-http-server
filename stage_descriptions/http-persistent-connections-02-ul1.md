In this stage, you'll extend your server to handle multiple concurrent persistent connections.

### Tests

The tester will execute your program like this:
```bash
$ ./your_program.sh
```

The tester will create two persistent connections and send multiple requests on each:
```bash
$ curl --http1.1 -v http://localhost:4221/user-agent -H "User-Agent: orange/mango-grape" --next http://localhost:4221/echo/apple
```

Your server must:
1. Handle multiple concurrent TCP connections
2. Keep each connection open for multiple requests
3. Process requests independently on each connection
4. Return appropriate responses for all requests

### Notes
- Each connection should be handled independently
- The server should maintain the state of each connection separately
- Requests on different connections can be processed concurrently