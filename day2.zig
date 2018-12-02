const std = @import("std");

pub fn main() void {
    std.debug.warn("{}\n", checksum(main_input));
}

test "sample inputs" {
    const sample_input =
        \\abcdef
        \\bababc
        \\abbcde
        \\abcccd
        \\aabcdd
        \\abcdee
        \\ababab
    ;
    const result = checksum(sample_input);
    std.debug.assert(result == 12);
}

fn checksum(text: []const u8) u64 {
    var it = std.mem.split(text, "\n");
    var twos: u64 = 0;
    var threes: u64 = 0;

    while (it.next()) |untrimmed| {
        var counts = [1]u8{0} ** 256;
        const trimmed = std.mem.trim(u8, untrimmed, " ");
        for (trimmed) |c| {
            counts[c] += 1;
        }
        var got_two = false;
        var got_three = false;
        for (counts) |count, c| {
            switch (count) {
                2 => got_two = true,
                3 => got_three = true,
                else => {},
            }
        }
        twos += @boolToInt(got_two);
        threes += @boolToInt(got_three);
    }

    return twos * threes;
}

const main_input =
    \\oiwcdpbseqgxryfmlpktnupvza
    \\oiwddpbsuqhxryfmlgkznujvza
    \\ziwcdpbsechxrvfmlgktnujvza
    \\oiwcgpbseqhxryfmmgktnhjvza
    \\owwcdpbseqhxryfmlgktnqjvze
    \\oiscdkbseqhxrffmlgktnujvza
    \\oiwcdibseqoxrnfmlgktnujvza
    \\oiwcdpbsejhxryfmlektnujiza
    \\oewcdpbsephxryfmlgkwnujvza
    \\riwcdpbseqhxryfmlgktnujzaa
    \\omwcdpbseqwxryfmlgktnujvqa
    \\oiwcdqqneqhxryfmlgktnujvza
    \\oawcdvaseqhxryfmlgktnujvza
    \\oiwcdabseqhxcyfmlkktnujvza
    \\oiwcdpbseqhxryfmlrktrufvza
    \\oiwcdpbseqhxdyfmlgqtnujkza
    \\oiwcdpbseqhxrmfolgktnujvzy
    \\oiwcdpeseqhxnyfmlgktnejvza
    \\oiwcdpbseqhxrynmlaktlujvza
    \\oiwcdpbseqixryfmlektncjvza
    \\liwtdpbseqhxryfylgktnujvza
    \\ouwcdpbszqhxryfmlgktnajvza
    \\oiwzdpbseqhxryfmngktnujvga
    \\wiwcfpbseqhxryfmlgktnuhvza
    \\oiwcdpbselhfryfmlrktnujvza
    \\oywcdpbveqhxryfmlgktnujdza
    \\oiwcdpbsiqhxryfmqiktnujvza
    \\obwcdhbseqhxryfmlgktnujvqa
    \\oitcdpbseqhfryfmlyktnujvza
    \\oiwcdpbseqhxryfmlnutnujqza
    \\oiwcdpbseqhxnyfmlhktnujtza
    \\oiwcdpbseqhbryfmlgkunuwvza
    \\oiwcopbseqhiryfmlgktnkjvza
    \\oiwcdpsseqhxryfklrktnujvza
    \\oiwcdpsrsqhxryfmlgktnujvza
    \\oiwcdpbsyqrxryfmlgktnujvzc
    \\ojwcepbseqhxryfmlgktnujvfa
    \\oiwcdpbseqhxrlfmlgvtnujvzr
    \\oiycdpbsethsryfmlgktnujvza
    \\eiwcdpbseqwxryfmlgktnujcza
    \\oiocdpbseqhxryfxlgktaujvza
    \\qiwydpbseqhpryfmlgktnujvza
    \\ziwcdpbseqhxryfmlgktsuuvza
    \\oiwcdpbseqheryfmygxtnujvza
    \\oiwidpbseqhxryfulgktnujvzm
    \\oiscdpdseqhxryfmlgktnujvya
    \\oiwmypbseqhxryfmlgktnuxvza
    \\oizcwbbseqhxryfmlgktnujvza
    \\oiwcdpbseqpxryfmlgxfnujvza
    \\oiwpdpbscqhxryxmlgktnujvza
    \\oiwcdpbseqhxrifrlgkxnujvza
    \\oiwcdpbsrqhxrifmlgktnzjvza
    \\tiwcdpbseqhxryfmegkvjujvza
    \\oiwcddbseqhxryfingktnujvza
    \\oiwcdpbsiqhiryfmlgktnucvza
    \\oiwcipbseqhxrkfmlgktnuvvza
    \\kiwcdpbseqhxryfmlbkonujvza
    \\qiwcdhbsedhxryfmlgktnujvza
    \\siwcdpbseqhxryfmsgktnujvua
    \\oqwcdpbseqhxryfmlyktndjvza
    \\oiwcqnbseehxryfmlgktnujvza
    \\oiwcdybseqhxryfmlgbtnujvia
    \\oiwcdpbsejhxryfdlgktngjvza
    \\oawcdpbseqhxrbfmlkktnujvza
    \\oilcdpbseqhhrjfmlgktnujvza
    \\oibcdpbseqhxryfmngktnucvza
    \\niwcdpbseqhxryfmlgkuaujvza
    \\oiwcdpbseqhxryfmqgmtnujvha
    \\oiwcdpbseqhcryfxlgktnzjvza
    \\oiwcdpaseqhxryfmqgktnujvzl
    \\oiwcdpbseqhxjyfmlgkonujvzx
    \\oiwmdzbseqlxryfmlgktnujvza
    \\oiwhdpbsexhxryfmlgktnujvzw
    \\oiwctpbseqhxryfmlgktnummza
    \\oiwcdpbseqoxrydmlgktnujvoa
    \\oiwkdpvseqhxeyfmlgktnujvza
    \\oixcdpbsemhxryfmlgctnujvza
    \\oimcdpbseqhxryfmlgktnujvlr
    \\oiwcdpbseehxrywmlgktnejvza
    \\oiwcdpbseqoxhyfmlgktnujyza
    \\oiwcdpbsethxryfmlgktnrjvxa
    \\oiwcdpbxeqhxryfmlgktnrjvzb
    \\ogeadpbseqhxryfmlgktnujvza
    \\eiwcdpbseqhxryfmlgktnvuvza
    \\oiwcdpbseqhxryfmlgktnujaxv
    \\siwcdpbsuqhxryfmlgktnuavza
    \\oixcdpbseqhxryfmlgatnujvzy
    \\oiwcdpbzeghmryfmlgktnujvza
    \\oiwcdpbieqhxryfmlgktyujvzr
    \\oiwcdpbseqhxeyfhlgktngjvza
    \\oiwcdpbseqhjoyrmlgktnujvza
    \\iiwcdpbseqhxryfmwhktnujvza
    \\oixcdpbsiqhxryfmagktnujvza
    \\oiwcdpfljqhxryfmlgktnujvza
    \\oivcdpbseqhxrqfmlgktnujvca
    \\ovwcdpbseqhxzyfmlgkenujvza
    \\oiwxdpgseqhxryfmlgktnhjvza
    \\oibcdpbbeohxryfmlgktnujvza
    \\oiwcrpbseqhxrygmlgwtnujvza
    \\jiwcdpbseqkxryfmlgntnujvza
    \\oiwcdbbseqhxrywmlgktnujvra
    \\oiwcdpbteqyxoyfmlgktnujvza
    \\oiwcdjbsvqvxryfmlgktnujvza
    \\obwcdukseqhxryfmlgktnujvza
    \\oifcdpdseqhxryfmlgktnujsza
    \\oiwcdpbseqhxryfalgktnujyda
    \\oiwcwpbseqhxrnfmkgktnujvza
    \\oswcdpbsethcryfmlgktnujvza
    \\oiwcdpbieqhxryfmlgktnuoiza
    \\oiwcdibsehhxryfmzgktnujvza
    \\oisjdpbseqhxryfmfgktnujvza
    \\oiwcjpbseqkxqyfmlgktnujvza
    \\obwcdpbshqhgryfmlgktnujvza
    \\oiwcspbseqhxryxmlgktnujvzl
    \\oiwcdvbswqhxryfmlgklnujvza
    \\oiwcdhuseqhxryfmlgdtnujvza
    \\oiwcdpbkeqdxryfmlgktnujvzv
    \\oiwcdpzseqhxcyfmlgksnujvza
    \\oiwcdpbseqhxryfmbkkvnujvza
    \\qiwcdpbseqhxrnfmlgktnujvha
    \\okwcdpbseqhxryfmdgktgujvza
    \\oiwcdpbkeqhxryfmldktnujvzu
    \\oiwctpxseqhxgyfmlgktnujvza
    \\oiwcdpbseqhxrykmlgktnujita
    \\oiwcdpbseqhxryfmldktyujnza
    \\oiwcdpbszqhxrjfmlgktnuqvza
    \\oiwcdpbeeqhxrykmlgktnujrza
    \\oiwcvpbseqhxryhmlgwtnujvza
    \\oiwcdpbpeehxryfmlgktnujvzz
    \\oiwcdbbsxqhxyyfmlgktnujvza
    \\oiwkdpbseqhxryfplgktnujeza
    \\opwcdpbseqhxdyfmlgctnujvza
    \\oowcdpbseqhnryfmlgktnujvga
    \\oawzdibseqhxryfmlgktnujvza
    \\oiwcdpbfeqzxrjfmlgktnujvza
    \\oiwcdpbseqaxryfmlgkonulvza
    \\oiacdpbseqvxryfmlgktvujvza
    \\oiwudpbseqhxryfwlgktnujvka
    \\oiwcdpbjeqhxryfymgktnujvza
    \\oiwcdpbweqhxrynmlgktnujaza
    \\oiwcdpbseqdxryfclgvtnujvza
    \\oiwcdppseqhxryfmlgmtzujvza
    \\oiwcdpbseqhxrhfelektnujvza
    \\kiwcdpbsnqhxryfmegktnujvza
    \\oiwcdpbseqpxryfmlgzwnujvza
    \\eiwcdpbseqnxryfplgktnujvza
    \\oiwcdbbseqhxryfmlmktnujvha
    \\oiwcdpbseqhxryfmlgktjhjvka
    \\oiwcdpbseqhxnyfylgktnujvzs
    \\oiwcdpbbxqhxryfmzgktnujvza
    \\opwcdpbseqhfryfmlgktnujzza
    \\oiwcdpbsjqpxryfmtgktnujvza
    \\oiwcdpbseqhyqbfmlgktnujvza
    \\oxwcdpbseqhxrffmlgktiujvza
    \\oiwcdpbseqhxgyfmlgytnujvzq
    \\oiwidpbseqhxryfmlgxtnujvzd
    \\oiwcdpbshqhxryzmlpktnujvza
    \\oifcdpbseqbxryfmlgktdujvza
    \\biwcdzbseqhxtyfmlgktnujvza
    \\oiwcdpbswqhxryfmlgutnujvca
    \\xiwcdpbseqhxryxmlnktnujvza
    \\oiwcdpzseqhxryfrlgktdujvza
    \\oiwudpbseqhxryfmlgkqnurvza
    \\oiwqdpbseihiryfmlgktnujvza
    \\iiwjdpbseqhxryamlgktnujvza
    \\oiwcdplseqhqryfmmgktnujvza
    \\oiwcdppseqhxrmfmlgklnujvza
    \\oiwcdobseqhxryfmmgkttujvza
    \\odwcdpbseqhxryfmlgktnujvyk
    \\oiwcdpkseqhxrhfmlgktntjvza
    \\oiocdpbseqhxryfmlgjknujvza
    \\oiicdpbieqhxryfmlgksnujvza
    \\oiwcdpbseqhxryemlgktnujdla
    \\oiwcdpbseqdxryfmlgktsujvzt
    \\oiwcdcksnqhxryfmlgktnujvza
    \\oowcdpbseqhxryfmlgsfnujvza
    \\oawcdpbseqhxryfmljktnuevza
    \\oiwcdpbsaqhxrffmzgktnujvza
    \\oiwcipbseqhcryfmlgktnujvga
    \\oiwcdpbsewhxrbfmlgktnuuvza
    \\oiwcdpbsewhxryfmlgkunujvzc
    \\oiwcdpbseqhxryfmlgktiujkga
    \\jiwcdpbseqhxrlfmlgktnurvza
    \\tiwcdpbseqoxryfmliktnujvza
    \\oiwcdpbsenhxryfmlgkskujvza
    \\oiwcdpbseqhxvyfmlhktoujvza
    \\oiwcdpbseqhxeyfmlgmtnunvza
    \\oiwcdpbseqhxdyfmloktnujvzu
    \\oiwcdpbseqgxryfmlgkynejvza
    \\oudcdpbseqhxryfmlgktmujvza
    \\oiwcdpbseqhxryfmvgktnucvzc
    \\oiwcdpbseqhxrysalgwtnujvza
    \\odwodpbseqhgryfmlgktnujvza
    \\oiwcdpbseqheryzmlgktnujgza
    \\oiwcdpbseqhxryfalgwtnujvba
    \\oiwcdpbseqhxryfmlgtdnuhvza
    \\oiocdpbseqhxrefulgktnujvza
    \\kiwcdpbseqhxrywolgktnujvza
    \\niwcdpbseksxryfmlgktnujvza
    \\oiwcdybseqexryfalgktnujvza
    \\oiwcdpbbeqhxryamlgktnujpza
    \\oiecdqbseqhxryfmlgktnujcza
    \\oiwcdpbsqqhxlyfmlpktnujvza
    \\oiwcdpbsaqheryfmlgktnujlza
    \\oiecdpbseqhxryfmlgkknujvzz
    \\oiwcapbsdqhxryfmlgktvujvza
    \\ojwcdxbseqhxryfmlgktrujvza
    \\oiwhdpbseqvxrzfmlgktnujvza
    \\oiwcdppseqhtryfmlgktnujvzs
    \\oikcdpbsfqhxryfmdgktnujvza
    \\owwczpbseqhxryfilgktnujvza
    \\oifwdpbseqhxryfmlgktnujfza
    \\oowcdpbseqhxrprmlgktnujvza
    \\oiwcapbseqhxryfmjgktnujvze
    \\oiwcdpaseqhdrybmlgktnujvza
    \\tiwcdpbseqhxryfmlgkvjujvza
    \\xiwcdpbseqhoryfmlgktnujvqa
    \\eiwrdpbsyqhxryfmlgktnujvza
    \\oiwcdpbseqhxranmlgktnujvzt
    \\oiwcdpbseqhxryfqlgktnudaza
    \\oiwcdpbsvqhxrywmlgktnsjvza
    \\oewcdpbseqhxryfmlgkunujvma
    \\oiwcdpbseqhjrywmlgktnujvzb
    \\omwcdpbseqhxryfmlgktwujsza
    \\oiwcdpbyxqhxryfmlgrtnujvza
    \\oiwidpbseqhxryfhlgktnunvza
    \\oqwcdpbweqhxrybmlgktnujvza
    \\oiwcdqbseqhxryfrlgktnujfza
    \\oiacdpbseqhdryfmlgktaujvza
    \\oiwcdpbstqhxmyfmlgktyujvza
    \\oiwcdpbseqhxeyfclgktjujvza
    \\wiwcdpeseqhxryfmlgktnujvzx
    \\viwcdpbseqhxryfmlgvtvujvza
    \\oircdpbseqhxcyfmlgktnujvma
    \\miwcdpbseqtwryfmlgktnujvza
    \\oiwcppbseqhxcyfmlgxtnujvza
    \\giwcrpbseqhxryfmlgktnudvza
    \\onwcvpbseqhxryfmlgktnujqza
    \\oiwcipbseqhxryfmlgitnuqvza
    \\oiwcdpbseqhxryjmlgkonufvza
    \\oiwnwpbseqhxtyfmlgktnujvza
    \\oiwcypbseqhxryfmlgetnujvzv
    \\oiwcdpbseqhxryqmljktnkjvza
    \\olwcdpbseqhxryfmlgkenujvba
    \\biwcdpbseqwxrywmlgktnujvza
    \\oiwcdpbsevhmryjmlgktnujvza
    \\oiwcdpbseqhxryfmlzktnkjvzv
    \\oiwudpbseqhxrefmlgktnujvia
    \\oiicdpbseqhxryfdloktnujvza
    \\oihcjpbsxqhxryfmlgktnujvza
;
