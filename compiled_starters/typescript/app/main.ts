import * as net from 'net';

// You can use print statements as follows for debugging, they'll be visible when running tests.
console.log("Logs from your program will appear here!");

const server = net.createServer((socket) => {
    socket.end();
});

// Uncomment this to pass the first stage
// server.listen(4221, 'localhost', () => {
//     console.log('Server is running on port 4221');
// });
