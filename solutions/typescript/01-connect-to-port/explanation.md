The entry point for your HTTP server implementation is in `app/main.ts`.

Study and uncomment the relevant code: 

```typescript
// Uncomment this to pass the first stage
const server = Deno.listen({ port: 4221, hostname: "localhost" });
for await (const conn of server) {
    conn.closeWrite();
    await conn.closed;
}
```

Push your changes to pass the first stage:

```
git add .
git commit -m "pass 1st stage" # any msg
git push origin master
```
