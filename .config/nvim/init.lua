require('plugins')
require('lsp')
require('treesitter')
require('tele')
require('completion')
require('keybinds')
require('alpha_greeter')
require('wilder')
require('nvim-autopairs').setup{}

local set = vim.opt

vim.cmd("set background=dark")
vim.cmd("colorscheme mountain")
vim.cmd("let g:enable_mountain_statusline = 1")

set.swapfile = false

set.expandtab = true
set.shiftwidth = 4

set.number = true
set.relativenumber = true

-- Command completion

vim.cmd("set wildoptions+=pum")

-- Disable wildmenu
set.wildmenu = false

-- Disable netrw

vim.cmd("let loaded_netrwPlugin = 1")

-- Enable true color

vim.api.nvim_exec(
[[
"Ue 24-bit (true-color) mode in Vim/Neovim when outside tmux.

"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)

if (empty($TMUX))
  if (has("nvim"))

    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))

    set termguicolors

  endif
endif
]],
true)
