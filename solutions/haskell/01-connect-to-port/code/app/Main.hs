{-# LANGUAGE OverloadedStrings #-}

module Main (main) where

import qualified Data.ByteString.Lazy.Char8 as BLC
import Network.Simple.TCP

main :: IO ()
main = do
    let host = "127.0.0.1"
        port = "4221"

    BLC.putStrLn $ "Listening on " <> BLC.pack host <> ":" <> BLC.pack port

    serve (Host host) port $ \(serverSocket, serverAddr) ->
        BLC.putStrLn $ "Accepted connection from " <> BLC.pack (show serverAddr) <> "."
