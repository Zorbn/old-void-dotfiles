-- Install VimPlug automatically

local plugin_setup = vim.api.nvim_exec(
[[
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source ../init.lua
endif
]],
true)

-- Install missing plugins

vim.api.nvim_exec(
[[
" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    \| PlugInstall --sync | source $MYVIMRC 
\| endif
]],
true)

local Plug = vim.fn['plug#']

-- Install plugins (using VimPlug)

vim.call('plug#begin', '~/.config/nvim/plugged')

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'neovim/nvim-lspconfig' 
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'
Plug 'williamboman/nvim-lsp-installer'

Plug 'windwp/nvim-autopairs'
Plug('gelguy/wilder.nvim', { ['do'] = ':UpdateRemotePlugins' })

Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug('folke/tokyonight.nvim', { ['branch'] = 'main' })
Plug 'goolord/alpha-nvim'

vim.call('plug#end')
