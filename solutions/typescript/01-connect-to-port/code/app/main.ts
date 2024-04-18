const server = Deno.listen({ port: 4221, hostname: "localhost" });
for await (const conn of server) {
    conn.closeWrite();
    await conn.closed;
}

// server.close();
