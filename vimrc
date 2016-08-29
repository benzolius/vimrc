"use space not TAB
set tabstop=8
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

"stuff indent
set autoindent
set smartindent

:syntax on
set encoding=utf-8

"showing line numbers and length
set number
set textwidth=79
"set nowrap "don't automaticaly wrap on load
set fo-=t
set colorcolumn=100
highlight ColorColumn ctermbg=233

set hlsearch
set tags=~/mytags
"copy and paste
set pastetoggle=<F2>
"set clipboard=unnamed

" enable mouse
"set mouse=a

" more visible cursor
set cursorline
set cursorcolumn

" backspace sometime not working
set bs=2
let mapleader = " "
"vnoremap <leader>s :sort<CR>

" $ needs shift, <-> is easier
nnoremap - $
vnoremap - $

"easy indentation
vnoremap < <gv
vnoremap > >gv

" Bind nohl
" " Removes highlight of your last search
" " ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
color wombat256mod

" setup Pathogen to manage your plugins
" mkdir -p ~/.vim/autoload ~/.vim/bundle
" curl -so ~/.vim/autoload/pathogen.vim curl 'www.vim.org/scripts/download_script.php?src_id=16224'
" Now you can install any plugin into .vim/bundle/plugin-name/ folder
filetype off
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on


" settings for vim-powerline
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
set laststatus=2

" settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" Settings for python-mode
" cd ~/.vim/bundle
" git clone https://github.com/klen/python-mode
" map <Leader>g :call RopeGotoDefinition()<CR>
let ropevim_enable_shortcuts = 1
let g:pymode_rope_goto_def_newwin = "vnew"
let g:pymode_rope_extended_complete = 1
let g:pymode_breakpoint = 0
let g:pymode_syntax = 1
let g:pymode_syntax_builtin_objs = 0
let g:pymode_syntax_builtin_funcs = 0
map <Leader>b Oimport pdb; pdb.set_trace()  # BREAKPOINT<C-c>


" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
     if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>


" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
set nofoldenable

" Load pylint code plugin
let g:pymode_lint = 1
"
" " Switch pylint, pyflakes, pep8, mccabe code-checkers
" " Can have multiply values pep8,pyflakes,mcccabe
let g:pymode_lint_checker = "pyflakes,pep8,mccabe"
"
" " Skip errors and warnings
" " E.g. "E501,W002", "E2,W" (Skip all Warnings and Errors startswith E2) and
" etc
let g:pymode_lint_ignore = "E501"

" " Select errors and warnings
" " E.g. "E4,W"
let g:pymode_lint_select = ""

" " Run linter on the fly
let g:pymode_lint_onfly = 0

" " Pylint configuration file
" " If file not found use 'pylintrc' from python-mode plugin directory
let g:pymode_lint_config = "$HOME/.pylintrc"
"
" " Check code every save
" let g:pymode_lint_write = 1
"
" " Auto open cwindow if errors be finded
let g:pymode_lint_cwindow = 1
"
" " Show error message if cursor placed at the error line
let g:pymode_lint_message = 1
"
" " Auto jump on first error
let g:pymode_lint_jump = 0
"
" " Hold cursor in current window
" " when quickfix is open
let g:pymode_lint_hold = 0
"
" " Place error signs
let g:pymode_lint_signs = 1
"
" " Maximum allowed mccabe complexity
let g:pymode_lint_mccabe_complexity = 8
"
" " Minimal height of pylint error window
let g:pymode_lint_minheight = 3
"
" " Maximal height of pylint error window
let g:pymode_lint_maxheight = 6
