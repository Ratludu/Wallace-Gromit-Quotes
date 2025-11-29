//! By convention, root.zig is the root source file when making a library.
const std = @import("std");
const rand = std.Random;

pub fn bufferedPrint(quote: []const u8) !void {
    // Stdout is for the actual output of your application, for example if you
    // are implementing gzip, then only the compressed bytes should be sent to
    // stdout, not any debugging messages.
    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    try stdout.print("\"{s}\"", .{quote});

    try stdout.flush(); // Don't forget to flush!
}

pub fn generateRandInt(max: u8) !u8 {
    var seed: u64 = undefined;
    try std.posix.getrandom(std.mem.asBytes(&seed));
    var prng = rand.DefaultPrng.init(seed);

    const rand_num = prng.random().intRangeAtMost(u8, 0, max);

    return rand_num;
}
