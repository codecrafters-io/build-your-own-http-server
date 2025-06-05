(ns http-server.core
  (:require
   [clojure.java.io :as io])
  (:import
   [java.net ServerSocket])
  (:gen-class))

(def port 4221)

(alter-var-root #'*out* (constantly *err*))

(defn serve []
  (let [server-sock (ServerSocket. port)]
    (.setReuseAddress server-sock true)
    (.accept server-sock)
    (binding [*out* (java.io.PrintWriter. System/out true)]
     (println "accepted new connection"))))

(defn -main [& args]

  (alter-var-root #'*out* (constantly (java.io.PrintWriter. System/out true)))


  (serve)

  )
