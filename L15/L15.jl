scancode_original_X280 = Dict(
	"VK_ESCAPE" => 0x01,
	"VK_OEM_3" => 0x29,
	"VK_OEM_MINUS" => 0x0c,
	"VK_OEM_PLUS" => 0x0d,
	"BLANK_YEN" => 0x7d, # AX_BACKSLASH
	"VK_Q" => 0x10,
	"VK_W" => 0x11,
	"VK_E" => 0x12,
	"VK_R" => 0x13,
	"VK_T" => 0x14,
	"VK_Y" => 0x15,
	"VK_U" => 0x16,
	"VK_I" => 0x17,
	"VK_O" => 0x18,
	"VK_P" => 0x19,
	"VK_OEM_4" => 0x1a,
	"VK_OEM_6" => 0x1b,
	"VK_CAPITAL" => 0x3a,
	"VK_A" => 0x1e,
	"VK_S" => 0x1f,
	"VK_D" => 0x20,
	"VK_F" => 0x21,
	"VK_G" => 0x22,
	"VK_H" => 0x23,
	"VK_J" => 0x24,
	"VK_K" => 0x25,
	"VK_L" => 0x26,
	"VK_OEM_1" => 0x27,
	"VK_OEM_7" => 0x28,
	"VK_OEM_5" => 0x2b,
	"VK_Z" => 0x2c,
	"VK_X" => 0x2d,
	"VK_C" => 0x2e,
	"VK_V" => 0x2f,
	"VK_B" => 0x30,
	"VK_N" => 0x31,
	"VK_M" => 0x32,
	"VK_OEM_COMMA" => 0x33,
	"VK_OEM_PERIOD" => 0x34,
	"VK_OEM_2" => 0x35,
	"BLANK_RO" => 0x73, # AX_BACKSLASH2 VK_OEM_102?
	"VK_LCONTROL" => 0x1d,
	"VK_LMENU" => 0x38,
	"BLANK_MUHENKAN" => 0x7b, # AX_MUHENKAN
	"BLANK_HENKAN" => 0x79, # AX_HENKAN
	"BLANK_KATAKANAHIRAGANA" => 0x70, # AX_EISUUKANA
	# "VK_KANJI" => 0x38, # 0xE038?
	"VK_KANJI" => 0xe038,
	"VK_OEM_COPYFINISH" => 0xe01d,
	# added manually
	"AX_BACKSLASH" => 0x2b,
	"AX_BACKSLASH2" => 0x56,
	"AX_MUHENKAN" => 0x5a,
	"AX_HENKAN" => 0x5b,
	"AX_EISUUKANA" => 0xe01d,
	"VK_OEM_102" => 0x73,
	"VK_RCONTROL" => 0xe01d,
	"VK_LAUNCH_APP2" => 0xe021,
)
map_dvorak_forward = Dict(
	"VK_OEM_3" => "VK_KANJI",
	"VK_OEM_MINUS" => "VK_OEM_4",
	"VK_OEM_PLUS" => "VK_OEM_6",
	"BLANK_YEN" => "AX_BACKSLASH",
	"VK_Q" => "VK_OEM_7",
	"VK_W" => "VK_OEM_COMMA",
	"VK_E" => "VK_OEM_PERIOD",
	"VK_R" => "VK_P",
	"VK_T" => "VK_Y",
	"VK_Y" => "VK_F",
	"VK_U" => "VK_G",
	"VK_I" => "VK_C",
	"VK_O" => "VK_R",
	"VK_P" => "VK_L",
	"VK_OEM_4" => "VK_OEM_2",
	"VK_OEM_6" => "VK_OEM_PLUS",
	"VK_CAPITAL" => "VK_LCONTROL",
	"VK_A" => "VK_A",
	"VK_S" => "VK_O",
	"VK_D" => "VK_E",
	"VK_F" => "VK_U",
	"VK_G" => "VK_I",
	"VK_H" => "VK_D",
	"VK_J" => "VK_H",
	"VK_K" => "VK_T",
	"VK_L" => "VK_N",
	"VK_OEM_1" => "VK_S",
	"VK_OEM_7" => "VK_OEM_MINUS",
	"VK_OEM_5" => "VK_OEM_3",
	"VK_Z" => "VK_OEM_1",
	"VK_X" => "VK_Q",
	"VK_C" => "VK_J",
	"VK_V" => "VK_K",
	"VK_B" => "VK_X",
	"VK_N" => "VK_B",
	"VK_M" => "VK_M",
	"VK_OEM_COMMA" => "VK_W",
	"VK_OEM_PERIOD" => "VK_V",
	"VK_OEM_2" => "VK_Z",
	"BLANK_RO" => "AX_BACKSLASH",
	"BLANK_MUHENKAN" => "AX_MUHENKAN",
	"BLANK_HENKAN" => "AX_HENKAN",
	"BLANK_KATAKANAHIRAGANA" => "VK_ESCAPE",
	"VK_KANJI" => "VK_LMENU",
	"VK_OEM_COPYFINISH" => "VK_LCONTROL",
)
map_ctrl_forward = Dict(
	"VK_CAPITAL" => "VK_LCONTROL",
)

function lestring(n)::String
	n = UInt16(n)
	bytes = reinterpret(UInt8, [n])
	return join([string(b, base = 16, pad = 2) for b in bytes], ",")
end
# function remap(code, map, path)
# 	open(path, "w") do out
#         println(out, "[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layout]")
# 		println(out, "\"Scancode Map\"=hex:00,00,00,00,00,00,00,00," * lestring(length(map)) * ",00,00,\\")
# 		for (before, after) in map
# 			# before == after && continue
# 			# println("#$before -> $after")
# 			# println("  " * after * "," * before * "\\")
# 			println(out, "  " * lestring(code[after]) * "," * lestring(code[before]) * ",\\")
# 		end
# 	end
# end
function remap(code, map)
        println(raw"[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layout]")
		println("\"Scancode Map\"=hex:00,00,00,00,00,00,00,00," * lestring(length(map)) * ",00,00,\\")
		for (before, after) in map
			# before == after && continue
			# println("#$before -> $after")
			# println("  " * after * "," * before * "\\")
			println("  " * lestring(code[after]) * "," * lestring(code[before]) * ",\\")
		end
end

remap(scancode_original_X280, map_ctrl_forward)
# print(lestring(0xe021))
