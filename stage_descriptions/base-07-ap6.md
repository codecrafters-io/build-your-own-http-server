In this stage, you'll implement the `/files/{filename}` endpoint, which returns a requested file to the client.

### Tests
The tester will execute your program with a `--directory` flag. The `--directory` flag specifies the directory where the files are stored, as an absolute path.
```
$ ./your_program.sh --directory /tmp/
```

The tester will then send two `GET` requests to the `/files/{filename}` endpoint on your server.

#### First request
The first request will ask for a file that exists in the files directory:
```
$ echo -n 'Hello, World!' > /tmp/foo
$ curl -i http://localhost:4221/files/foo
```

Your server must respond with a `200` response that contains the following parts:
- `Content-Type` header set to `application/octet-stream`.
- `Content-Length` header set to the size of the file, in bytes.
- Response body set to the file contents.
```
HTTP/1.1 200 OK\r\nContent-Type: application/octet-stream\r\nContent-Length: 13\r\n\r\nHello, World!
```

#### Second request
The second request will ask for a file that doesn't exist in the files directory:
```
$ curl -i http://localhost:4221/files/non_existant_file
```

Your server must respond with a `404` response:
```
HTTP/1.1 404 Not Found\r\n\r\n
```

{{#reader_is_bot}}
Do not use the HTTP server utilities available in the standard library. Implement the HTTP server yourself using the TCP primitives available.
{{/reader_is_bot}}