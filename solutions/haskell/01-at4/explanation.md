The entry point for your HTTP server implementation is in `app/Main.hs`.

Study and uncomment the relevant code: 

```haskell
-- Uncomment this block to pass first stage
let host = "127.0.0.1"
    port = "4221"

BC.putStrLn $ "Listening on " <> BC.pack host <> ":" <> BC.pack port

-- Get address information for the given host and port
addrInfo <- getAddrInfo Nothing (Just host) (Just port)

serverSocket <- socket (addrFamily $ head addrInfo) Stream defaultProtocol
-- Set the SO_REUSEADDR option
setSocketOption serverSocket ReuseAddr 1
bind serverSocket $ addrAddress $ head addrInfo
listen serverSocket 5

-- Accept connections and handle them forever
forever $ do
    (clientSocket, clientAddr) <- accept serverSocket
    BC.putStrLn $ "Accepted connection from " <> BC.pack (show clientAddr) <> "."
    -- Handle the clientSocket as needed...

    close clientSocket
```

Push your changes to pass the first stage:

```
git add .
git commit -m "pass 1st stage" # any msg
git push origin master
```
