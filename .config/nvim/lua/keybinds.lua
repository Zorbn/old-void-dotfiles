
local map = vim.api.nvim_set_keymap

-- Leader

map('n', '<Space>', '', {})
vim.g.mapleader = ' '

-- Normal mode keybinds

local n_keymap = function(lhs, rhs)
    map('n', lhs, rhs, { noremap = true, silent = true })
end

n_keymap('gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
n_keymap('gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
n_keymap('gr', '<cmd>lua vim.lsp.buf.references()<cr>')
n_keymap('gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')

n_keymap('<leader>cf', '<cmd>lua vim.lsp.buf.formatting()<cr>')
n_keymap('<leader>cr', '<cmd>lua vim.lsp.buf.rename()<cr>')

n_keymap('K', '<cmd>lua vim.lsp.buf.hover()<cr>')
n_keymap('<leader>ca', '<cmd>Telescope lsp_code_actions<cr>')

-- Telescope

n_keymap('<leader>ff', ":lua require'telescope.builtin'.find_files(require'telescope.themes'.get_ivy({}))<cr>")
n_keymap('<leader>fb', ":lua require'telescope.builtin'.buffers(require'telescope.themes'.get_ivy({}))<cr>")

-- Terminal mode keybinds

map('t', '<Esc>', '<C-\\><C-n>', { noremap = true })
