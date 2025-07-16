In this stage, you'll implement the `/user-agent` endpoint, which reads the `User-Agent` request header and returns it in the response body.

### The `User-Agent` header

The [`User-Agent`](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/User-Agent) header describes the client's user agent.

Your `/user-agent` endpoint must read the `User-Agent` header, and return it in your response body. Here's an example of a `/user-agent` request:
```javascript
// Request line
GET
/user-agent
HTTP/1.1
\r\n

// Headers
Host: localhost:4221\r\n
User-Agent: foobar/1.2.3\r\n  // Read this value
Accept: */*\r\n
\r\n

// Request body (empty)
```

Here is the expected response:
```javascript
// Status line
HTTP/1.1 200 OK               // Status code must be 200
\r\n

// Headers
Content-Type: text/plain\r\n
Content-Length: 12\r\n
\r\n

// Response body
foobar/1.2.3                  // The value of `User-Agent`
```

### Tests

The tester will execute your program like this:
```bash
$ ./your_program.sh
```

The tester will then send a `GET` request to the `/user-agent` endpoint on your server. The request will have a `User-Agent` header.
```bash
$ curl -v --header "User-Agent: foobar/1.2.3" http://localhost:4221/user-agent
```

Your server must respond with a `200` response that contains the following parts:
- `Content-Type` header set to `text/plain`.
- `Content-Length` header set to the length of the `User-Agent` value.
- Message body set to the `User-Agent` value.
```javascript
HTTP/1.1 200 OK\r\nContent-Type: text/plain\r\nContent-Length: 12\r\n\r\nfoobar/1.2.3
```

### Notes
- Header names are [case-insensitive](https://datatracker.ietf.org/doc/html/rfc9112#name-field-syntax).

{{#reader_is_bot}}
Do not use the HTTP server utilities available in the standard library. Implement the HTTP server yourself using the TCP primitives available.
{{/reader_is_bot}}