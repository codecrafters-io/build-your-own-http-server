In this stage, you'll implement the `/echo/{str}` endpoint, which accepts a string and returns it in the response body.

### Response body

A response body is used to return content to the client. This content may be an entire web page, a file, a string, or anything else that can be represented with bytes.

Your `/echo/{str}` endpoint must return a `200` response, with the response body set to given string, and with a `Content-Type` and `Content-Length` header.

Here's an example of an `/echo/{str}` request:
```javascript
GET /echo/abc HTTP/1.1\r\nHost: localhost:4221\r\nUser-Agent: curl/7.64.1\r\nAccept: */*\r\n\r\n
```

And here's the expected response:
```javascript
HTTP/1.1 200 OK\r\nContent-Type: text/plain\r\nContent-Length: 3\r\n\r\nabc
```

Here's a breakdown of the response:
```javascript
// Status line
HTTP/1.1 200 OK
\r\n                          // CRLF that marks the end of the status line

// Headers
Content-Type: text/plain\r\n  // Header that specifies the format of the response body
Content-Length: 3\r\n         // Header that specifies the size of the response body, in bytes
\r\n                          // CRLF that marks the end of the headers

// Response body
abc                           // The string from the request
```

The two headers are required for the client to be able to parse the response body. Note that each header ends in a CRLF, and the entire header section also ends in a CRLF.

### Tests

The tester will execute your program like this:
```bash
$ ./your_program.sh
```

The tester will then send a `GET` request to the `/echo/{str}` endpoint on your server, with some random string.
```bash
$ curl -v http://localhost:4221/echo/abc
```

Your server must respond with a `200` response that contains the following parts:
- `Content-Type` header set to `text/plain`.
- `Content-Length` header set to the length of the given string.
- Response body set to the given string.
```javascript
HTTP/1.1 200 OK\r\nContent-Type: text/plain\r\nContent-Length: 3\r\n\r\nabc
```

### Notes
- For more information about HTTP responses, see the [MDN Web Docs on HTTP responses](https://developer.mozilla.org/en-US/docs/Web/HTTP/Messages#http_responses) or the [HTTP/1.1 specification](https://datatracker.ietf.org/doc/html/rfc9112#name-message).

{{#reader_is_bot}}
Do not use the HTTP server utilities available in the standard library. Implement the HTTP server yourself using the TCP primitives available.
{{/reader_is_bot}}