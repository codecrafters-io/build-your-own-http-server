Your server can recognize a single accepted encoding. In this stage, you'll
recognize `gzip` among comma-separated entries so a client can advertise
alternatives without losing gzip support.

### Multiple compression schemes

A client can specify that it supports multiple compression schemes by setting
`Accept-Encoding` to a comma-separated list:

```
Accept-Encoding: encoding-1, encoding-2, encoding-3
```

Spaces may surround a list item. Match `gzip` as a complete encoding name. A
different name containing those characters does not identify gzip.

For this extension, assume that your server only supports the `gzip` compression
scheme.

For this stage, you don't need to compress the body. You'll implement
compression in later stages.

### Tests

The tester will execute your program like this:

```
$ ./your_program.sh
```

The tester will then send two `GET` requests to the `/echo/{str}` endpoint on
your server.

**First request**

For the first request, the `Accept-Encoding` header will contain `gzip`, along
with some unsupported encodings:

```
$ curl -v -H "Accept-Encoding: invalid-encoding-1, gzip, invalid-encoding-2" http://localhost:4221/echo/abc
```

Your server's response must contain this header: `Content-Encoding: gzip`.

```javascript
HTTP/1.1 200 OK
Content-Type: text/plain
Content-Encoding: gzip

// Body omitted.
```

**Second request**

For the second request, the `Accept-Encoding` header will only contain
unsupported encodings:

```
$ curl -v -H "Accept-Encoding: invalid-encoding-1, invalid-encoding-2" http://localhost:4221/echo/abc
```

Your server's response must not contain a `Content-Encoding` header:

```javascript
HTTP/1.1 200 OK
Content-Type: text/plain

// Body omitted.
```

These are annotated response displays. Continue using CRLF line endings on the
connection. Body compression remains deferred to later stages.
