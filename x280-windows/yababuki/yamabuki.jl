# using Base.Iterators: partition
using StringEncodings

struct YabSection
    mapchars::Vector{String}
    text::String
end
function YabSection(mapchars::Vector{String})
    row1 = join(mapchars[2:14], ",")
    row2 = join(mapchars[17:28], ",")
    row3 = join(mapchars[31:42], ",")
    row4 = join(mapchars[46:56], ",")
    text = row1 * "\n" * row2 * "\n" * row3 * "\n" * row4
    return YabSection(mapchars, text)
end

struct YabWhole
    layout_name::String
    en::YabSection
    el::YabSection
    er::YabSection
    jn::YabSection
    jl::YabSection
    jr::YabSection
end

function save_yab(whole::YabWhole, filename::String)
    content = """
    ;$(whole.layout_name)

    [英数シフト無し]
    $(whole.en.text)

    [英数左親指シフト]
    $(whole.el.text)

    [英数右親指シフト]
    $(whole.er.text)

    [シフト無し]
    $(whole.jn.text)

    [左親指シフト]
    $(whole.jl.text)

    [右親指シフト]
    $(whole.jr.text)
    """
    content = encode(content, "UTF-16")
    write(filename, content)
end

function read_yab(filename::String)
    mapchars = [fill("", 56) for _ = 1:6]
    current_section = ""
    line_count = 0
    current_section = 0
    lines = []

    open(filename, enc"UTF-16", "r") do file
        lines = collect(eachline(file))
    end
    layout_name = lines[1][2:end]
    for line in lines
        line = strip(line)
        if startswith(line, "[")
            current_section += 1 #strip(line[2:end-3])
            line_count = 0
        elseif current_section != 0
            line_count += 1
            if line_count == 1
                mapchars[current_section][2:14] .= split(line, ",")
            elseif line_count == 2
                mapchars[current_section][17:28] .= split(line, ",")
            elseif line_count == 3
                mapchars[current_section][31:42] .= split(line, ",")
            elseif line_count == 4
                mapchars[current_section][46:56] .= split(line, ",")
            end
        end
    end

    en = YabSection(mapchars[1])
    el = YabSection(mapchars[2])
    er = YabSection(mapchars[3])
    jn = YabSection(mapchars[4])
    jl = YabSection(mapchars[5])
    jr = YabSection(mapchars[6])

    return YabWhole(layout_name, en, el, er, jn, jl, jr)
end

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
    # added
    "VK_1" => "VK_1",
    "VK_2" => "VK_2",
    "VK_3" => "VK_3",
    "VK_4" => "VK_4",
    "VK_5" => "VK_5",
    "VK_6" => "VK_6",
    "VK_7" => "VK_7",
    "VK_8" => "VK_8",
    "VK_9" => "VK_9",
    "VK_0" => "VK_0",
)

section_VK = YabSection([
    "",
    "VK_1",
    "VK_2",
    "VK_3",
    "VK_4",
    "VK_5",
    "VK_6",
    "VK_7",
    "VK_8",
    "VK_9",
    "VK_0",
    "VK_OEM_MINUS",
    "VK_OEM_PLUS",
    "BLANK_YEN",
    "",
    "",
    "VK_Q",
    "VK_W",
    "VK_E",
    "VK_R",
    "VK_T",
    "VK_Y",
    "VK_U",
    "VK_I",
    "VK_O",
    "VK_P",
    "VK_OEM_4",
    "VK_OEM_6",
    "",
    "",
    "VK_A",
    "VK_S",
    "VK_D",
    "VK_F",
    "VK_G",
    "VK_H",
    "VK_J",
    "VK_K",
    "VK_L",
    "VK_OEM_1",
    "VK_OEM_7",
    "VK_OEM_5",
    "",
    "",
    "",
    "VK_Z",
    "VK_X",
    "VK_C",
    "VK_V",
    "VK_B",
    "VK_N",
    "VK_M",
    "VK_OEM_COMMA",
    "VK_OEM_PERIOD",
    "VK_OEM_2",
    "BLANK_RO",
])

function reverse_lookup(dict::Dict, value)
    for (key, val) in dict
        if val == value
            return key
        end
    end
    error("Value not found in dictionary.")
end

function tlsplit()
    read_path = joinpath(@__DIR__, "tron-jiskana.yab")
    tron = read_yab(read_path)

    mapchars = [fill("", 56) for _ = 1:6]
    for i = 1:56
        VK_after = section_VK.mapchars[i]
        if VK_after == ""
            continue
        elseif i == 14 || i == 56
            index = 14
        elseif i == 42
            index = 27
        else
            # key = findfirst(x -> map_dvorak_forward[x] == VK_after, keys(map_dvorak_forward))
            key = reverse_lookup(map_dvorak_forward, VK_after)
            index = findfirst(x -> x == key, section_VK.mapchars)
        end
        println("$(i) : $(index)")
        mapchars[1][i] = tron.en.mapchars[index]
        mapchars[2][i] = tron.el.mapchars[index]
        mapchars[3][i] = tron.er.mapchars[index]
        mapchars[4][i] = tron.jn.mapchars[index]
        mapchars[5][i] = tron.jl.mapchars[index]
        mapchars[6][i] = tron.jr.mapchars[index]
    end

    en = YabSection(mapchars[1])
    el = YabSection(mapchars[2])
    er = YabSection(mapchars[3])
    jn = YabSection(mapchars[4])
    jl = YabSection(mapchars[5])
    jr = YabSection(mapchars[6])
    tron_x280 = YabWhole("tron-x280", en, el, er, jn, jl, jr)


    save_path = joinpath(@__DIR__, "tron-x280.yab")
    save_yab(tron_x280, save_path)
end
tlsplit()