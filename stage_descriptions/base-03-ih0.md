Your server currently sends the same `200` response for every request. In this
stage, you'll read the URL path and return `200` for `/` or `404 Not Found` for
other paths.

### HTTP request

An HTTP/1.1 request starts with a request line. Headers follow it, then an
optional body. The request line and each header end with
[CRLF](https://developer.mozilla.org/en-US/docs/Glossary/CRLF) (`\r\n`). An
empty line ends the headers, just as in a response.

Here's an example of an HTTP request:

```javascript
GET /index.html HTTP/1.1\r\nHost: localhost:4221\r\nUser-Agent: curl/7.64.1\r\nAccept: */*\r\n\r\n
```

Here's an annotated breakdown. The request-line fields are separated by spaces
in the actual request, and the comments are only labels:

```javascript
// Request line
GET                          // HTTP method
/index.html                  // Request target
HTTP/1.1                     // HTTP version
\r\n                         // CRLF that marks the end of the request line

// Headers
Host: localhost:4221\r\n     // Header that specifies the server's host and port
User-Agent: curl/7.64.1\r\n  // Header that describes the client's user agent
Accept: */*\r\n              // Header that specifies which media types the client can accept
\r\n                         // CRLF that marks the end of the headers

// Request body (empty)
```

The "request target" specifies the URL path for this request. In this example,
the URL path is `/index.html`.

TCP supplies a byte stream, so a socket read can return only part of a request.
HTTP's delimiters identify message structure independently of how the bytes
arrive.

### Tests

The tester will execute your program like this:

```bash
$ ./your_program.sh
```

The tester checks a `GET` request with a random non-root path. For example:

```bash
$ curl -v http://localhost:4221/abcdefg
```

Your server must respond to this request with a `404` response:

```javascript
HTTP/1.1 404 Not Found\r\n\r\n
```

Keep the existing behavior for a `GET` request with the path `/`:

```bash
$ curl -v http://localhost:4221
```

Your server must respond to this request with a `200` response:

```javascript
HTTP/1.1 200 OK\r\n\r\n
```

### Notes

- You can ignore the headers for now. You'll learn about parsing headers in a
  later stage.
- In this stage, the request target is written as a URL path. But the request
  target actually has
  [four possible formats](https://datatracker.ietf.org/doc/html/rfc9112#section-3.2).
  The URL path format is called the "origin form," and it's the most commonly
  used format. The other formats are used for more niche scenarios, like sending
  a request through a proxy.
- For more information about HTTP requests, see the
  [MDN Web Docs on HTTP requests](https://developer.mozilla.org/en-US/docs/Web/HTTP/Messages#http_requests)
  or the
  [HTTP/1.1 specification](https://datatracker.ietf.org/doc/html/rfc9112#name-message).

{{#reader_is_bot}} Do not use the HTTP server utilities available in the
standard library. Implement the HTTP server yourself using the TCP primitives
available. {{/reader_is_bot}}
