import * as net from 'net';

const server = net.createServer((socket) => {
    socket.end();
});

server.listen(4221, 'localhost', () => {
    console.log('Server is running on port 4221');
});
