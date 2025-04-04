function main()
    code_original_X280 = Dict(
        "KEY_MINUS" => "0c",
        "KEY_EQUAL" => "0d",
        "KEY_Q" => "10",
        "KEY_W" => "11",
        "KEY_E" => "12",
        "KEY_R" => "13",
        "KEY_T" => "14",
        "KEY_Y" => "15",
        "KEY_U" => "16",
        "KEY_I" => "17",
        "KEY_O" => "18",
        "KEY_P" => "19",
        "KEY_LEFTBRACE" => "1a",
        "KEY_RIGHTBRACE" => "1b",
        "KEY_A" => "1e",
        "KEY_S" => "1f",
        "KEY_D" => "20",
        "KEY_F" => "21",
        "KEY_G" => "22",
        "KEY_H" => "23",
        "KEY_J" => "24",
        "KEY_K" => "25",
        "KEY_L" => "26",
        "KEY_SEMICOLON" => "27",
        "KEY_APOSTROPHE" => "28",
        "KEY_BACKSLASH" => "2b",
        "KEY_Z" => "2c",
        "KEY_X" => "2d",
        "KEY_C" => "2e",
        "KEY_V" => "2f",
        "KEY_B" => "30",
        "KEY_N" => "31",
        "KEY_M" => "32",
        "KEY_COMMA" => "33",
        "KEY_DOT" => "34",
        "KEY_SLASH" => "35",
        "KEY_CAPSLOCK" => "3a",
        "KEY_YEN" => "7d",
        "KEY_RO" => "73",
        "KEY_KATAKANAHIRAGANA" => "70",
    )
    map_dvorak_forward = Dict(
        "KEY_MINUS" => "KEY_LEFTBRACE",
        "KEY_EQUAL" => "KEY_RIGHTBRACE",
        "KEY_Q" => "KEY_APOSTROPHE",
        "KEY_W" => "KEY_COMMA",
        "KEY_E" => "KEY_DOT",
        "KEY_R" => "KEY_P",
        "KEY_T" => "KEY_Y",
        "KEY_Y" => "KEY_F",
        "KEY_U" => "KEY_G",
        "KEY_I" => "KEY_C",
        "KEY_O" => "KEY_R",
        "KEY_P" => "KEY_L",
        "KEY_LEFTBRACE" => "KEY_SLASH",
        "KEY_RIGHTBRACE" => "KEY_EQUAL",
        "KEY_A" => "KEY_A",
        "KEY_S" => "KEY_O",
        "KEY_D" => "KEY_E",
        "KEY_F" => "KEY_U",
        "KEY_G" => "KEY_I",
        "KEY_H" => "KEY_D",
        "KEY_J" => "KEY_H",
        "KEY_K" => "KEY_T",
        "KEY_L" => "KEY_N",
        "KEY_SEMICOLON" => "KEY_S",
        "KEY_APOSTROPHE" => "KEY_MINUS",
        "KEY_BACKSLASH" => "KEY_GRAVE",
        "KEY_Z" => "KEY_SEMICOLON",
        "KEY_X" => "KEY_Q",
        "KEY_C" => "KEY_J",
        "KEY_V" => "KEY_K",
        "KEY_B" => "KEY_X",
        "KEY_N" => "KEY_B",
        "KEY_M" => "KEY_M",
        "KEY_COMMA" => "KEY_W",
        "KEY_DOT" => "KEY_V",
        "KEY_SLASH" => "KEY_Z",
        "KEY_CAPSLOCK" => "KEY_LEFTCTRL",
        "KEY_YEN" => "KEY_BACKSLASH",
        "KEY_RO" => "KEY_RIGHTMETA",
        "KEY_KATAKANAHIRAGANA" => "KEY_ESC",
    )

    remap(code_original_X280, map_dvorak_forward)
end
function remap(code, map)
    for (before, after) in map
        before == after && continue
        println("#$before -> $after")
        println(" KEYBOARD_KEY_" * code[before] * "=" * lowercase(after))
    end
end
main()