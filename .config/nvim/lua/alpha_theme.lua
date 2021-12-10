local if_nil = vim.F.if_nil

local default_header = {
    type = "text",
    val = {
        [[                                /^L_      ,."\               ]],
        [[           /~\       __       /~    \   ./    \              ]],
        [[          /   _\   _/  \     /T~\|~\_\ / \_  /~|          _^ ]],
        [[        / \ /W  \ / V^\/X  /~         T  . \/   \    ,v-./   ]],
        [[ ,'`-. /~   ^     H  ,  . \/    ;   .   \      `. \-'   /    ]],
        [[     M      ~     | . ;  /         ,  _   :  .    ~\_,-'     ]],
        [[    /    ~    .    \    /   :                   '   \   ,/`  ]],
        [[   I o. ^    oP     '98b         -      _  9.`       `\9b.   ]],
        [[ 8oO888.  oO888P  d888b9bo. .8o 888o.       8bo.  o     988o.]],
        [[ 88888888888888888888888888bo.98888888bo.    98888bo. .d888P ]],
        [[ 88888888888888888888888888888888888888888888888888888888888 ]],
        [[ 88888888888888P"   "" "   """9888P" P" "8P"   ""*9888888888 ]],
    },
    opts = {
        position = "center",
        hl = "Type",
        -- wrap = "overflow";
    },
}

local footer = {
    type = "text",
    val = "\n",
    opts = {
        position = "center",
        hl = "Number",
    },
}

--- @param sc string
--- @param txt string
--- @param keybind string optional
--- @param keybind_opts table optional
local function button(sc, txt, keybind, keybind_opts)
    local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

    local opts = {
        position = "center",
        shortcut = sc,
        cursor = 5,
        width = 50,
        align_shortcut = "right",
        hl_shortcut = "Keyword",
    }
    if keybind then
        keybind_opts = if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
        opts.keymap = { "n", sc_, keybind, keybind_opts }
    end

    local function on_press()
        local key = vim.api.nvim_replace_termcodes(sc_ .. "<Ignore>", true, false, true)
        vim.api.nvim_feedkeys(key, "normal", false)
    end

    return {
        type = "button",
        val = txt,
        on_press = on_press,
        opts = opts,
    }
end

local buttons = {
    type = "group",
    val = {
        button("e", "  New file", "<cmd>ene <CR>"),
        button("SPC f f", "  Find file"),
    },
    opts = {
        spacing = 1,
    },
}

local section = {
    header = default_header,
    buttons = buttons,
    footer = footer,
}

local opts = {
    layout = {
        { type = "padding", val = 2 },
        section.header,
        { type = "padding", val = 2 },
        section.buttons,
        { type = "padding", val = 2 },
        section.footer,
    },
    opts = {
        margin = 5,
    },
}

return {
    button = button,
    section = section,
    opts = opts,
}
