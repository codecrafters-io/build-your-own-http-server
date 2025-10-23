const std = @import("std");
const net = std.net;

pub fn main() !void {
    // You can use print statements as follows for debugging, they'll be visible when running tests.
    std.debug.print("Logs from your program will appear here!\n", .{});

    // TODO: Uncomment the code below to pass the first stage
    // const address = try net.Address.resolveIp("127.0.0.1", 4221);
    // var listener = try address.listen(.{
    //     .reuse_address = true,
    // });
    // defer listener.deinit();
    //
    // _ = try listener.accept();
    // std.debug.print("client connected!", .{});
}
