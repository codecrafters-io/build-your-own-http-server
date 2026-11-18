You can reuse one connection for several requests. A client pausing between
requests must not prevent another connected client from receiving a response. In
this stage, you'll combine persistent connections with concurrent client
handling.

### Independent connections

Each connection has its own stream of bytes. An unfinished request on one
connection must not be completed with bytes from another, and one client's
headers must not affect another client's response.

### Tests

The tester will execute your program like this:

```bash
$ ./your_program.sh
```

The tester will open multiple persistent connections and send repeated requests
on each. The number of connections varies. This command illustrates a sequence
on one connection:

```bash
$ curl --http1.1 -v http://localhost:4221/user-agent -H "User-Agent: orange/mango-grape" --next http://localhost:4221/echo/apple
```

Your server must:

1. Handle multiple concurrent TCP connections
2. Keep each connection open for multiple requests
3. Process requests independently on each connection
4. Return appropriate responses for all requests

The endpoint behavior and response framing stay the same as in earlier stages.
The new requirement is that several clients can continue those exchanges
independently.
