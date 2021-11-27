vim.cmd("let mapleader=' '")

vim.cmd('set relativenumber')
vim.cmd('set number')

vim.cmd('set encoding=utf-8')
vim.cmd('set fileencoding=utf-8')
vim.cmd('set fileencodings=utf-8')

vim.cmd('set bomb')
vim.cmd('set binary')
vim.cmd('set ttyfast')
vim.cmd('set backspace=indent,eol,start')
vim.cmd('set hidden')

vim.cmd('set tabstop=2')
vim.cmd('set softtabstop=2')
vim.cmd('set shiftwidth=2')
vim.cmd('set expandtab')
vim.cmd('set nowrap')

-- Searching
vim.cmd('set hlsearch')
vim.cmd('set incsearch')
vim.cmd('set ignorecase')
vim.cmd('set smartcase')

-- Colors
vim.cmd('set termguicolors')
vim.cmd('syntax enable')
vim.cmd('set background=light')
vim.cmd('colorscheme solarized')
vim.cmd('hi Normal guibg=NONE')

-- Filetypes
vim.cmd('au BufEnter *.graphql :set ft=graphql')

-- Format on save
local filetypes = {'ts', 'tsx', 'js', 'jsx', 'go', 'rs'}
for _, ft in ipairs(filetypes) do
  vim.cmd(string.format('autocmd BufWritePre *.%s lua vim.lsp.buf.formatting_sync(nil, 1000)', ft))
  vim.cmd(string.format('autocmd BufWritePre *.%s.in lua vim.lsp.buf.formatting_sync(nil, 1000)', ft))
end
