const std = @import("std");

pub fn main(init: std.process.Init) !void {
    const io = init.io;

    // You can use print statements as follows for debugging, they'll be visible when running tests.
    try std.Io.File.writeStreamingAll(std.Io.File.stderr(), io, "Logs from your program will appear here!\n");

    // TODO: Uncomment the code below to pass the first stage
    //
    // const address = try std.Io.net.IpAddress.parseIp4("127.0.0.1", 4221);
    // var server = try address.listen(io, .{
    //     .reuse_address = true,
    // });
    // defer server.deinit(io);
    //
    // _ = try server.accept(io);
    // std.debug.print("client connected!", .{});
}
