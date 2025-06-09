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
    (binding [*out* (java.io.PrintWriter. System/out true)]
     (println "accepted new connection"))))

(defn -main [& args]
  (serve)

  )
