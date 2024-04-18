const server = Deno.listen({ port: 4221, hostname: "localhost" });
for await (const conn of server) {
  conn.closeWrite(); // Close the write side of the connection
  await conn.closed; // Wait for the connection to be fully closed
}

// server.close();
