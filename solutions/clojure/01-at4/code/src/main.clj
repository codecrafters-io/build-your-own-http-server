(ns main
  (:gen-class))

(defn -main [& args]
(try
  (with-open [server-socket (java.net.ServerSocket. 4221)]
    (doto server-socket
      (.setReuseAddress true)
      (.accept))
    (println "accepted new connection"))
  (catch java.io.IOException e
    (println (str "IOException: " (.getMessage e)))))
)