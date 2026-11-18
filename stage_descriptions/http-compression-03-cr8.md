Your server can now select gzip through the request headers. In this stage,
you'll make `Content-Encoding: gzip` describe the actual body by sending a
[`gzip`-compressed](https://www.gzip.org/) representation of the echoed string.

### The gzip body

Gzip is a binary format with a header, compressed data, and a trailer containing
validation information. A compression library can produce the complete gzip
format. Raw DEFLATE data and zlib-wrapped data use different formats and won't
satisfy a gzip decoder.

### Tests

The tester will execute your program like this:

```
$ ./your_program.sh
```

Then, the tester will send a `GET` request to the `/echo/{str}` endpoint on your
server. The request will contain an `Accept-Encoding` header that includes
`gzip`.

```
$ curl -v -H "Accept-Encoding: gzip" http://localhost:4221/echo/abc | hexdump -C
```

Your server's response must contain the following:

- `200` response code.
- `Content-Type` header set to `text/plain`.
- `Content-Encoding` header set to `gzip`.
- `Content-Length` header set to the size of the compressed body.
- Response body set to the `gzip`-compressed `str` parameter.

```
HTTP/1.1 200 OK
Content-Encoding: gzip
Content-Type: text/plain
Content-Length: 23

1F 8B 08 00 00 00 00 00  // This is the hexadecimal representation of the body.
00 03 4B 4C 4A 06 00 C2  // It should actually be sent as binary data.
41 24 35 03 00 00 00
```

This example represents 23 body bytes that decompress to `abc`. Send those bytes
as binary data, with ordinary HTTP/1.1 CRLF framing for the headers. Valid
encoders can produce different bytes or lengths, so calculate `Content-Length`
from your own compressed output. The required result is a valid gzip body that
decompresses to the requested string.

### Notes

- To check that your compressed body is correct, you can run
  `echo -n <uncompressed-str> | gzip | hexdump -C`.
- It's normal for a very short string like `abc` to increase in size when
  compressed.
- If the client doesn't accept gzip, keep the uncompressed response and omit
  `Content-Encoding` as before.
