let mapleader= " "
nmap <leader>t :TagbarToggle<CR>
"nnoremap <C-c> :NERDTreeFocus<CR>
"nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ") })<CR>
" Window movement shortcuts
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Move line(s) up/down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
" Space in normal mode
nnoremap <Space> i<Space><Esc>
 " Insert line above/below
nnoremap <silent> ]<Space> :<C-u>put =repeat(nr2char(10),v:count)<Bar>execute "'[-1"<CR>
nnoremap <silent> [<Space> :<C-u>put!=repeat(nr2char(10),v:count)<Bar>execute "']+1"<CR>
nnoremap <BS> i<BS><Esc>`^
" Delete next word in insert mode
inoremap <C-del> <C-o>de
"cnoremap term split term
" coc shortcuts
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
set wildcharm=<Tab>
nnoremap <leader>. :b <Tab>
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr> <Enter> pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Esc> pumvisible() ? "\<C-e>" : "\<Esc>"

call plug#begin('~/vimfiles/plugged')
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
"Plug 'github/copilot.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'jiangmiao/auto-pairs'
Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree' " NerdTree
"Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
" Install "Plug 'mhinz/vim-startify'
Plug 'https://github.com/tpope/vim-obsession'
" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
Plug 'yaegassy/coc-tailwindcss3', {'do': 'yarn install --frozen-lockfile'}
Plug 'sainnhe/gruvbox-material'
Plug 'sheerun/vim-polyglot'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate' }
" ES2015 code snipets (Optional)
Plug 'epilande/vim-es2015-snippets'
" React code snippets
Plug 'epilande/vim-react-snippets'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'justinj/vim-react-snippets'
"Plug 'SirVer/ultisnips'
Plug 'ThePrimeagen/vim-be-good' " Practice Vim!
Plug 'abecodes/tabout.nvim'
call plug#end()

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Tabout installation
lua << EOF
-- vim.cmd("packadd nvim-treesitter")
require'nvim-treesitter.configs'.setup {
	-- my config here
}
require('tabout').setup {
    tabkey = '<Tab>', -- key to trigger tabout
    act_as_tab = true, -- shift content if tab out is not possible
    completion = true, -- if the tabkey is used in a completion pum
    tabouts = {
		{open = "'", close = "'"},
		{open = '"', close = '"'},
		{open = '`', close = '`'},
		{open = '(', close = ')'},
		{open = '[', close = ']'},
		{open = '{', close = '}'}
	},
    ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
}
EOF

let g:neocomplete#enable_at_startup = 1

"let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
" Enable JSX syntax support
let g:jsx_ext_required = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:tokyonight_style = "night"

syntax enable
colorscheme gruvbox-material
"hi normal guibg=none ctermbg=none

"use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

noremap <silent><expr> <Tab>
     \ pumvisible() ? "\<C-n>" :
     \ <SID>check_back_space() ? "\<Tab>" :
     \ coc#refresh()

noremap <silent><expr> <TAB>
     \ pumvisible() ? "\<C-n>" :
     \ <SID>check_back_space() ? "\<TAB>" :
     \ coc#refresh()
noremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

fun! TrimWhiteSpace()
    let l:save= winsaveview()
    keeppatterns %s/\s\+$//e
endfun

augroup JORGE
    autocmd!
    autocmd BufWritePre * :call TrimWhiteSpace()
augroup End

" comments
" augroup comment_like_a_boss
    " autocmd!
    " autocmd FileType c,cpp,go                let b:comment_leader = '// '
    " autocmd FileType ruby,python             let b:comment_leader = '# '
    " autocmd FileType conf,fstab,sh,bash,tmux let b:comment_leader = '# '
    " autocmd FileType tex                     let b:comment_leader = '% '
    " autocmd FileType mail                    let b:comment_leader = '> '
    " autocmd FileType vim                     let b:comment_leader = '" '
" augroup END
" noremap <silent><leader>cc :<C-b>silent <C-e>norm ^i<C-r>=b:comment_leader<CR><CR>
" noremap <silent><leader>uc :<C-b>silent <C-e>norm ^xx<CR>
"
