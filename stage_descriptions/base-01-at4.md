HTTP/1.1 requests arrive over TCP connections, so the server first needs a way
for clients to reach it. In this stage, you'll listen for TCP connections on
port `4221`.

### TCP connections

A TCP connection carries an ordered stream of bytes between two programs. A
listening socket accepts new connections on a chosen port. You don't need to
read requests or send HTTP responses yet.

### Tests

The tester will execute your program like this:

```
$ ./your_program.sh
```

Keep your program running so the tester can connect to port `4221`. A successful
TCP connection completes this stage.

### Notes

- To learn how HTTP works, you'll implement your server from scratch using TCP
  primitives, without relying on built-in or external HTTP libraries.
