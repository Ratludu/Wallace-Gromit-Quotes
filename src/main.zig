const Wallace_Gromit_Quotes = @import("Wallace_Gromit_Quotes");

pub fn main() !void {
    const slice_strings = [_][]const u8{ "Cheese, Gromit!", "Cracking toast, Gromit!", "Hold tight, lad!", "More cheese, Gromit?", "I've got a plan, Gromit… a cunning plan!", "Don't worry, Gromit—I'll sort this out!", "Everything’s under control… probably!", "Hang on, Gromit!", "Been reading the papers, have we?", "That's it, Gromit! Steady now!" };
    const rand_num = try Wallace_Gromit_Quotes.generateRandInt(slice_strings.len - 1);
    try Wallace_Gromit_Quotes.bufferedPrint(slice_strings[rand_num]);
}
