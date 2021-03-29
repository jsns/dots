syntax on
set relativenumber
set nu
set tabstop=4 softtabstop=4
set shiftwidth=4
set smartindent
set nowrap
set nohlsearch
set noswapfile
set nobackup
set noerrorbells
set hidden
set colorcolumn=80
set smartindent
set incsearch
set scrolloff=6
set signcolumn=yes
set termguicolors

let loaded_matchparen=1

call plug#begin(stdpath('data') . '/plugged')
Plug 'junegunn/vim-closer'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" colorschemes
Plug 'chuling/equinusocio-material.vim'
Plug 'tomasr/molokai'
call plug#end()

" buffer nav
nnoremap <C-J> :bnext <CR>
nnoremap <C-K> :bprevious <CR>

" Cfg cmd
command Cfg :e ~/.config/nvim/init.vim

" FZF
nnoremap <C-p> :FZF <CR>

let g:equinusocio_material_style = 'pure'
colorscheme equinusocio_material

" LSP and Autocomplete 
set completeopt=menuone,noinsert,noselect
let g:completion_confirm_key = "\<C-y>"
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

:lua << EOF
		local lspconfig = require('lspconfig')
		local on_attach = function(_, bufnr)
				require('completion').on_attach()
				local opts = { noremap=true, silent=true }
				vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
				vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
				vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)

		end
		local servers = {'jsonls', 'clangd', 'tsserver'}
		for _, lsp in ipairs(servers) do
				lspconfig[lsp].setup {
						on_attach = on_attach
				}
		end
EOF
