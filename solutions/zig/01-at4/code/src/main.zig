const std = @import("std");

pub fn main(init: std.process.Init) !void {
    const io = init.io;

    const address = try std.Io.net.IpAddress.parseIp4("127.0.0.1", 4221);
    var server = try address.listen(io, .{
        .reuse_address = true,
    });
    defer server.deinit(io);

    _ = try server.accept(io);
    std.debug.print("client connected!", .{});
}
