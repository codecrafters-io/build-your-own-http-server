const std = @import("std");
const net = std.net;

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();

    const address = try net.Address.resolveIp("127.0.0.1", 4221);

    // var listener = try address.listen(.{
    //     .reuse_address = true,
    // });
    // defer listener.deinit();

    // const connection = try listener.accept();
    // try stdout.print("accepted new connection", .{});
    // connection.stream.close();
}
