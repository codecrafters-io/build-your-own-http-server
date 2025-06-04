(ns http-server.core
  (:require
   [clojure.java.io :as io])
  (:import
   [java.net ServerSocket])
  (:gen-class))

(def port 4221)

(defn serve []
  (let [server-sock (ServerSocket. port)]
    (.setReuseAddress server-sock true)
    (.accept server-sock)
    (println "accepted new connection")))

(defn -main [& args]
    (println "Logs from your program will appear here!"))

  (serve)
  )
