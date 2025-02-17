The entry point for your HTTP server implementation is in `src/main.clj`.

Study and uncomment the relevant code: 

```clojure
;;   Uncomment this block to pass the first stage
(try
  (with-open [server-socket (java.net.ServerSocket. 4221)]
    (doto server-socket
      (.setReuseAddress true)
      (.accept))
    (println "accepted new connection"))
  (catch java.io.IOException e
    (println (str "IOException: " (.getMessage e)))))
```

Push your changes to pass the first stage:

```
git add .
git commit -m "pass 1st stage" # any msg
git push origin master
```
