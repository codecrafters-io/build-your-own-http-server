<?php
error_reporting(E_ALL);

$serverSocket = socket_create(AF_INET, SOCK_STREAM, SOL_TCP);

// Since the tester restarts your program quite often, setting SO_REUSEADDR
// ensures that we don't run into 'Address already in use' errors
socket_set_option($serverSocket, SOL_SOCKET, SO_REUSEADDR, 1);

socket_bind($serverSocket, "localhost", 4221);
socket_listen($serverSocket);
socket_accept($serverSocket);

socket_close($serverSocket);