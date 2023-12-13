using System.Net;
using System.Net.Sockets;

TcpListener server = new TcpListener(IPAddress.Any, 4221);
server.Start();
server.AcceptSocket(); // wait for client
