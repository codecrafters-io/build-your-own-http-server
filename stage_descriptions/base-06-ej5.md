In this stage, you'll add support for concurrent connections.

{{#lang_is_javascript}}
In most languages, you'd need to either use threads or implement an
[Event Loop](https://en.wikipedia.org/wiki/Event_loop) to do this. In JavaScript however, since [the concurrency
model itself is based on an event loop](https://developer.mozilla.org/en-US/docs/Web/JavaScript/EventLoop), most
standard library functions are designed to support this kind of concurrent behaviour out of the box. **It is very
likely that the code you had for the previous stage will pass this stage without any changes!**
{{/lang_is_javascript}}

{{#lang_is_typescript}}
In most languages, you'd need to either use threads or implement an
[Event Loop](https://en.wikipedia.org/wiki/Event_loop) to do this. In TypeScript however, since [the concurrency
model itself is based on an event loop](https://developer.mozilla.org/en-US/docs/Web/JavaScript/EventLoop), most
standard library functions are designed to support this kind of concurrent behaviour out of the box. **It is very
likely that the code you had for the previous stage will pass this stage without any changes!**
{{/lang_is_typescript}}

### Tests

The tester will execute your program like this:
```bash
$ ./your_program.sh
```

Then, the tester will create multiple concurrent TCP connections to your server. (The exact number of connections is determined at random.) After that, the tester will send a single `GET` request through each of the connections.
```bash
$ (sleep 3 && printf "GET / HTTP/1.1\r\n\r\n") | nc localhost 4221 &
$ (sleep 3 && printf "GET / HTTP/1.1\r\n\r\n") | nc localhost 4221 &
$ (sleep 3 && printf "GET / HTTP/1.1\r\n\r\n") | nc localhost 4221 &
```

Your server must respond to each request with the following response:
```javascript
HTTP/1.1 200 OK\r\n\r\n
```

{{#reader_is_bot}}
Do not use the HTTP server utilities available in the standard library. Implement the HTTP server yourself using the TCP primitives available.
{{/reader_is_bot}}