"  ####       ##      ## |
" #    #      ##      ## |
"##	    #     ##      ## |
"##	    ##    ##      ## |
"#########    ########## |
"##	    ##    ##      ## |
"##	    ## #  ##      ## |
"________________________|
"Ahmad Humayun | init.vim|
"______________|_________|

"======SET UP PLUGINS========================
call plug#begin('~/.config/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'tomasiser/vim-code-dark'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}
Plug 'ctrlpvim/ctrlp.vim'
Plug 'w0rp/ale' " Does asynchronous linting
Plug 'jelera/vim-javascript-syntax'
Plug 'tpope/vim-fugitive' " git plugin
Plug 'tpope/vim-rhubarb' " required by fugitive to :Gbrowse
Plug 'maxmellon/vim-jsx-pretty'
"Plug 'sheerun/vim-polyglot' " language pack for syntax and indents
call plug#end()
"============================================

"======BASIC CONFIG========================================
set clipboard=unnamed " Allow copying from external sources
set noswapfile " Get rid of annoying swapfile notifs
set ignorecase " Ignore case when performing search
"==========================================================

"======ESSENTIAL KEY BINDINGS================
inoremap jk <ESC>
tnoremap jk <C-\><C-n>
nnoremap " ea"<ESC>bi"<ESC>e
nnoremap <SPACE>[ ea]<ESC>bi[<ESC>e
nnoremap <SPACE>] ea]<ESC>bi[<ESC>e
nnoremap <SPACE>( ea)<ESC>bi(<ESC>e
nnoremap <SPACE>) ea)<ESC>bi(<ESC>e
nnoremap <SPACE>{ ea}<ESC>bi{<ESC>e
nnoremap <SPACE>} ea}<ESC>bi{<ESC>e
noremap <F3> :w<RETURN>
inoremap <F3> <ESC>:w<RETURN>
noremap <TAB> :tabnext<RETURN>
noremap <S-TAB> :tabNext<RETURN>
nnoremap <SPACE>o :NERDTreeToggle<RETURN>
noremap <SPACE>q :q<RETURN>
nnoremap <SPACE>h <C-w><LEFT>
nnoremap <SPACE>j <C-w><DOWN>
nnoremap <SPACE>k <C-w><UP>
nnoremap <SPACE>l <C-w><RIGHT>
nnoremap <SPACE>p :CtrlP<RETURN>
nnoremap <SPACE>t :let $VIM_DIR=expand('%:p:h')<CR>:10split<CR>:terminal<CR>
nnoremap <SPACE>r :let $VIM_DIR=expand('%:p:h')<CR>:vsplit<CR>:terminal<CR>cd $VIM_DIR<CR>
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>
nnoremap ; $
nnoremap d; d$
nnoremap y; y$
nnoremap c; c$
"============================================


"======PLUGIN CONFIGS===================================================
"------------/airline---------------------------------------------------
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
    let g:airline#extensions#tabline#left_sep = ' '
    let g:airline#extensions#tabline#left_alt_sep = '|'
    let g:airline_left_sep          = '▶'
    let g:airline_left_alt_sep      = '»'
    let g:airline_right_sep         = '◀'
    let g:airline_right_alt_sep     = '«'
    let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
    let g:airline#extensions#readonly#symbol   = '⊘'
    let g:airline#extensions#linecolumn#prefix = '¶'
    let g:airline#extensions#paste#symbol      = 'ρ'
    let g:airline_symbols.linenr    = '␊'
    let g:airline_symbols.branch    = '⎇'
    let g:airline_symbols.paste     = 'ρ'
    let g:airline_symbols.paste     = 'Þ'
    let g:airline_symbols.paste     = '∥'
    let g:airline_symbols.whitespace = 'Ξ'
else
    let g:airline#extensions#tabline#left_sep = ''
    let g:airline#extensions#tabline#left_alt_sep = ''

    " powerline symbols
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.linenr = ''
endif
"------------/coc-----------------------------------------------------------------------
let coc_global_extensions = [
            \ 'coc-snippets',
            \ 'coc-pairs',
            \ 'coc-tsserver',
            \ 'coc-eslint',
            \ 'coc-prettier',
            \ 'coc-marketplace',
            \ 'coc-html',
            \ 'coc-css',
            \ 'coc-clangd',
            \ 'coc-json',
            \ ]
set hidden 
set updatetime=300
set shortmess+=c " don't give \|ins-completion-menu \| messages.
set signcolumn=yes
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

"------------/ctrlp----------------------------------------------------------------
" Ignore files that git ignores during search
let g:ctrlp_user_command = [
            \'.git/',
            \ 'git --git-dir=%s/.git ls-files -oc --exclude-standard',
            \ ]
"==================================================================================

"=====CHANGE SOME DEFAULTS===================
set number
set relativenumber
set splitbelow
set splitright
set tabstop=4
set shiftwidth=4
set expandtab
colorscheme codedark
"============================================
