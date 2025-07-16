In this stage, you'll create a TCP server that listens on port 4221.

[TCP](https://www.cloudflare.com/en-ca/learning/ddos/glossary/tcp-ip/) is the underlying protocol used by HTTP servers.


### Tests

The tester will execute your program like this:

```
$ ./your_program.sh
```

Then, the tester will try to connect to your server on port 4221. The connection must succeed for you to pass this stage.

### Notes

- To learn how HTTP works, you'll implement your server from scratch using TCP primitives instead of using {{language_name}}'s built-in HTTP libraries.