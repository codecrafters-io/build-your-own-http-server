In this stage, you'll add support for [`gzip` compression](https://www.gzip.org/) to your HTTP server.

### Tests

The tester will execute your program like this:
```
$ ./your_program.sh
```

Then, the tester will send a `GET` request to the `/echo/{str}` endpoint on your server. The request will contain an `Accept-Encoding` header that includes `gzip`.
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

### Notes

- To check that your compressed body is correct, you can run `echo -n <uncompressed-str> | gzip | hexdump -C`.
- It's normal for a very short string like `abc` to increase in size when compressed.
