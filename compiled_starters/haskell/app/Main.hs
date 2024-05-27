{-# LANGUAGE OverloadedStrings #-}

module Main (main) where

import Control.Monad (forever)
import qualified Data.ByteString.Char8 as BC
import Network.Socket
import System.IO (BufferMode (..), hSetBuffering, stdout)

main :: IO ()
main = do
    hSetBuffering stdout LineBuffering

    -- You can use print statements as follows for debugging, they'll be visible when running tests.
    BC.putStrLn "Logs from your program will appear here"

    -- Uncomment this block to pass first stage
    -- let host = "127.0.0.1"
    --     port = "4221"
    --
    -- BC.putStrLn $ "Listening on " <> BC.pack host <> ":" <> BC.pack port
    --
    -- -- Get address information for the given host and port
    -- addrInfo <- getAddrInfo Nothing (Just host) (Just port)
    --
    -- serverSocket <- socket (addrFamily $ head addrInfo) Stream defaultProtocol
    -- bind serverSocket $ addrAddress $ head addrInfo
    -- listen serverSocket 5
    --
    -- -- Accept connections and handle them forever
    -- forever $ do
    --     (clientSocket, clientAddr) <- accept serverSocket
    --     BC.putStrLn $ "Accepted connection from " <> BC.pack (show clientAddr) <> "."
    --     -- Handle the clientSocket as needed...
    --
    --     close clientSocket
