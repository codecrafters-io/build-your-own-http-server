import * as net from 'net';

const server = net.createServer((socket) => {
    socket.end();
});

// You can use print statements as follows for debugging, they'll be visible when running tests.
console.log("Logs from your program will appear here!");

// Uncomment this to pass the first stage
// server.listen(4221, 'localhost', () => {
//     console.log('Server is running on port 4221');
// });
