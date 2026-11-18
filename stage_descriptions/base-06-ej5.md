A client waiting to send its request must not prevent your server from
responding to another client. In this stage, you'll handle multiple concurrent
TCP connections.

### Concurrent clients

The HTTP response rules stay unchanged.

Concurrent handling lets work on several connections overlap. It doesn't require
those connections to execute on separate CPU cores. Threads and event-driven I/O
are possible approaches, and the choice is yours.

{{#lang_is_javascript}} The runtime's
[event loop](https://en.wikipedia.org/wiki/Event_loop) can handle overlapping
socket activity through asynchronous callbacks. If your server already uses
these APIs, it may need no changes. Synchronous work can still block other
connections. See the
[event-loop concurrency model](https://developer.mozilla.org/en-US/docs/Web/JavaScript/EventLoop)
for details. {{/lang_is_javascript}}

{{#lang_is_typescript}} The runtime's
[event loop](https://en.wikipedia.org/wiki/Event_loop) can handle overlapping
socket activity through asynchronous callbacks. If your server already uses
these APIs, it may need no changes. Synchronous work can still block other
connections. See the
[event-loop concurrency model](https://developer.mozilla.org/en-US/docs/Web/JavaScript/EventLoop)
for details. {{/lang_is_typescript}}

### Tests

The tester will execute your program like this:

```bash
$ ./your_program.sh
```

Then, the tester will create multiple concurrent TCP connections to your server.
(The exact number of connections is determined at random.) After that, the
tester will send a single `GET` request through each of the connections.

```bash
$ (sleep 3 && printf "GET / HTTP/1.1\r\n\r\n") | nc localhost 4221 &
$ (sleep 3 && printf "GET / HTTP/1.1\r\n\r\n") | nc localhost 4221 &
$ (sleep 3 && printf "GET / HTTP/1.1\r\n\r\n") | nc localhost 4221 &
```

Your server must respond to each request with the following response:

```javascript
HTTP/1.1 200 OK\r\n\r\n
```

The server must remain available for new connections after earlier clients
disconnect. Reusing one connection for multiple requests comes in the Persistent
Connections extension.

{{#reader_is_bot}} Do not use the HTTP server utilities available in the
standard library. Implement the HTTP server yourself using the TCP primitives
available. {{/reader_is_bot}}
