The entry point for your HTTP server implementation is in `app/main.ts`.

Study and uncomment the relevant code: 

```typescript
// Uncomment this to pass the first stage
server.listen(4221, 'localhost', () => {
    console.log('Server is running on port 4221');
});
```

Push your changes to pass the first stage:

```
git add .
git commit -m "pass 1st stage" # any msg
git push origin master
```
