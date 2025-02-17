(ns main
  (:gen-class))

(defn -main [& args]
;;   You can use print statements as follows for debugging, they'll be visible when running tests.
  (println "Logs from your program will appear here!")
;;   Uncomment this block to pass the first stage
;; (try
;;   (with-open [server-socket (java.net.ServerSocket. 4221)]
;;     (doto server-socket
;;       (.setReuseAddress true)
;;       (.accept))
;;     (println "accepted new connection"))
;;   (catch java.io.IOException e
;;     (println (str "IOException: " (.getMessage e)))))
)