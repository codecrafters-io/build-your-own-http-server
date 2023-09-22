const net = require('net');

// You can use print statements as follows for debugging, they'll be visible when running tests.
console.log("Logs from your program will appear here!");

// Uncomment this to pass the first stage
// const server = net.createServer((socket) => {
//     console.log('Client connected');
//   
//     socket.on('end', () => {
//         console.log('Client disconnected');
//     });
// });
//
// server.on('error', (err) => {
//     if (err.code === 'EADDRINUSE') {
//         console.log("Failed to bind to port 4221");
//     } else {
//         console.log('Error:', err.message);
//     }
//     process.exit(1);
// });
//
// server.listen(4221, '0.0.0.0', () => {
//     console.log('Server is listening on 0.0.0.0:4221');
// });
