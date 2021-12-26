vim.api.nvim_exec(
[[
    call wilder#setup({
        \ 'modes': [':', '/', '?'],
        \ 'next_key': '<C-l>',
        \ 'previous_key': '<C-h>',
        \ 'accept_key': '<C-j>',
        \ 'reject_key': '<C-k>',
        \ })
]],
true)
