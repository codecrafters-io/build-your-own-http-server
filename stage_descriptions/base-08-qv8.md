In this stage, you'll add support for the `POST` method of the `/files/{filename}` endpoint, which accepts text from the client and creates a new file with that text.

### Request body

A request body is used to send data from the client to the server.

Here's an example of a `POST /files/{filename}` request:
```
// Request line
POST /files/number HTTP/1.1
\r\n

// Headers
Host: localhost:4221\r\n
User-Agent: curl/7.64.1\r\n
Accept: */*\r\n
Content-Type: application/octet-stream  // Header that specifies the format of the request body
Content-Length: 5\r\n                   // Header that specifies the size of the request body, in bytes
\r\n

// Request Body
12345
```

### Tests

The tester will execute your program with a `--directory` flag. The `--directory` flag specifies the directory to create the file in, as an absolute path.
```
$ ./your_program.sh --directory /tmp/
```

The tester will then send a `POST` request to the `/files/{filename}` endpoint on your server, with the following parts:
- `Content-Type` header set to `application/octet-stream`.
- `Content-Length` header set to the size of the request body, in bytes.
- Request body set to some random text.

```
$ curl -v --data "12345" -H "Content-Type: application/octet-stream" http://localhost:4221/files/file_123
```

Your server must return a `201` response:
```
HTTP/1.1 201 Created\r\n\r\n
```

Your server must also create a new file in the files directory, with the following requirements:
- The filename must equal the `filename` parameter in the endpoint.
- The file must contain the contents of the request body.

{{#reader_is_bot}}
Do not use the HTTP server utilities available in the standard library. Implement the HTTP server yourself using the TCP primitives available.
{{/reader_is_bot}}