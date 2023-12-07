The entry point for your HTTP server implementation is in `app/Main.hs`.

Study and uncomment the relevant code: 

```haskell
-- Uncomment this block to pass first stage
let host = "127.0.0.1"
    port = "4221"

BLC.putStrLn $ "Listening on " <> BLC.pack host <> ":" <> BLC.pack port

serve (Host host) port $ \(serverSocket, serverAddr) ->
    BLC.putStrLn $ "Accepted connection from " <> BLC.pack (show serverAddr) <> "."
```

Push your changes to pass the first stage:

```
git add .
git commit -m "pass 1st stage" # any msg
git push origin master
```
