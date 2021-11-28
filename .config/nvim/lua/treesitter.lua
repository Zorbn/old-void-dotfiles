require'nvim-treesitter.configs'.setup {
    ensure_installed = { "c_sharp", "go", "rust" },
    highlight = {
        enable = true,
        disable = {},
    },
    indent = {
        enable = false,
        disable = {},
    },
}
