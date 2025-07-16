Welcome to the HTTP Compression extension! In this extension, you'll add support for [compression](https://en.wikipedia.org/wiki/HTTP_compression) to your HTTP server.

In this stage, you'll add support for the `Accept-Encoding` and `Content-Encoding` headers.

### `Accept-Encoding` and `Content-Encoding`

An HTTP client uses the `Accept-Encoding` header to specify the compression schemes it supports. In the following example, the client specifies that it supports the `gzip` compression scheme:
```
> GET /echo/foo HTTP/1.1
> Host: localhost:4221
> User-Agent: curl/7.81.0
> Accept: */*
> Accept-Encoding: gzip  // Client specifies it supports the gzip compression scheme.
```

The server then chooses one of the compression schemes listed in `Accept-Encoding` and compresses the response body with it.

Then, the server sends a response with the compressed body and a `Content-Encoding` header. `Content-Encoding` specifies the compression scheme that was used.

In the following example, the response body is compressed with `gzip`:
```
< HTTP/1.1 200 OK
< Content-Encoding: gzip    // Server specifies that the response body is compressed with gzip.
< Content-Type: text/plain  // Original media type of the body.
< Content-Length: 23        // Size of the compressed body.
< ...                       // Compressed body.
```

If the server doesn't support any of the compression schemes specified by the client, then it will not compress the response body. Instead, it will send a standard response and omit the `Content-Encoding` header.

For this extension, assume that your server only supports the `gzip` compression scheme.

For this stage, you don't need to compress the body. You'll implement compression in a later stage.

### Tests

The tester will execute your program like this:
```
$ ./your_program.sh
```

The tester will then send two `GET` requests to the `/echo/{str}` endpoint on your server.

#### First request

First, the tester will send a request with this header: `Accept-Encoding: gzip`.
```
$ curl -v -H "Accept-Encoding: gzip" http://localhost:4221/echo/abc
```

Your server's response must contain this header: `Content-Encoding: gzip`.
```
HTTP/1.1 200 OK
Content-Type: text/plain
Content-Encoding: gzip

...  // Body omitted.
```

#### Second request

Next, the tester will send a request with this header: `Accept-Encoding: invalid-encoding`.
```
$ curl -v -H "Accept-Encoding: invalid-encoding" http://localhost:4221/echo/abc
```

Your server's response must not contain a `Content-Encoding` header:
```
HTTP/1.1 200 OK
Content-Type: text/plain

...  // Body omitted.
```

### Notes

- You'll add support for `Accept-Encoding` headers with multiple compression schemes in a later stage.
- There's another method for HTTP compression that uses the `TE` and `Transfer-Encoding` headers. We won't cover that method in this extension.
