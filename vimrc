" Mauro's vimrc

" Reload vimrc after it changed
autocmd! bufwritepost .vimrc source %

set nocompatible		" turn on the 'IMproved' in VIM

" Remap the <Leader> to '<space>'. This needs to be done before we load the plugins.
let mapleader="\<Space>"
" Remap the <LocalLeader> (leader for a specific file type)
let maplocalleader=";"

" Plugin management by vundle
" see https://github.com/gmarik/Vundle.vim for more information
"
" Quick help
"
" :PluginList           - list confgured plugins
" :PluginInstall        - install plugins
" :PluginUpdate         - update plugins
"
" For more help: :h vundle or go to the website
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundle itself (required)
Plugin 'gmarik/vundle'

" UltiSnips
if has("python")

    " YCM suggests that g:UltiSnipsExpandTrigger, 
    " g:UltiSnipsJumpForwardTrigger, and g:UltiSnipsJumpBackwardTrigger
    " be overridden
    "
    " Otherwise use ':bdelete' to just close the buffer and keep the window
    let g:UltiSnipsEditSplit="vertical"
    " To avoid collision with YouCompleteMe
    let g:UltiSnipsExpandTrigger="<c-k>"
    "let g:UltiSnipsJumpForwardTrigger="<c-k>"  " doesn't work as expected
    let g:UltiSnipsListSnippets="<s-c-k>"
    Plugin 'SirVer/ultisnips'
    " Actually I'd rather write my own snippets in ~/.vim/UltiSnips
    "Plugin 'honza/vim-snippets'
endif

" YouCompleteMe: https://github.com/Valloric/YouCompleteMe
" This is a rather big module, only load it when not being root
if $USER!='root'
    if v:version > 703 || (v:version==703 && has('patch584'))
        " Various YCM settings
        let g:ycm_complete_in_comments=1
        let g:ycm_add_preview_to_completeopt=1
        let g:ycm_autoclose_preview_window_after_completion=0
        let g:ycm_autoclose_preview_window_after_insertion=1
        " This might be a security risk as the .ycm.. is automatically loaded now
        let g:ycm_confirm_extra_conf=0
        let g:ycm_error_symbol='EE'
        let g:ycm_warning_symbol='WW'
        let g:ycm_seed_identifiers_with_syntax=1
        let g:ycm_goto_buffer_command='horizontal-split'
        Plugin 'Valloric/YouCompleteMe'
        " Jump to definition:
        " (note that you can go back with Ctrl-O and forward with Ctrl-P)
        nnoremap <Leader>yg :YcmCompleter GoTo<CR>
        nnoremap <C-P> <C-I>
        " Update all diagnostics
        nnoremap <Leader>yu :YcmForceCompileAndDiagnosics<CR>
        " Show a list of all errors in the location-bar
        nnoremap <Leader>ys :YcmDiags<CR>
        " Show the type of the object under the cursor
        nnoremap <Leader>yt :YcmCompleter GetType<CR>
        " Show the docstring to the object under the cursor
        nnoremap <Leader>yd :YcmCompleter GetDoc<CR>
        " Have YCM try to fix an error
        nnoremap <Leader>yf :YcmCompleter FixIt<CR>
        " YCM-Generator is a plugin to generate the .ycm_extra_conf.py file
        Plugin 'rdnetto/YCM-Generator'
        " Invoke using :YcmGenerateConfig
        function RegenerateYCMConfig()
            silent execute '![ -f .ycm_extra_conf.py ] && rm .ycm_extra_conf.py'
            YcmGenerateConfig
            echo 'You will need to restart vim :('
        endfunction
        nnoremap <Leader>yc :call RegenerateYCMConfig()<CR>
    endif
endif

" NERD-commenter: https://github.com/scrooloose/nerdcommenter
if v:version > 700
    let NERDCreateDefaultMappings=0       " disable default mappings
    map <Leader>cc <plug>NERDCommenterAlignLeft
    map <Leader>co <plug>NERDCommenterSexy
    map <Leader>ci <plug>NERDCommenterUncomment
    Plugin 'scrooloose/nerdcommenter'
endif

" NERDtree: https://github.com/scrooloose/nerdtree
if v:version > 700
    Plugin 'scrooloose/nerdtree'
    let NERDTreeHijackNetrw=1
    nnoremap <C-e> :NERDTreeToggle<CR>
    inoremap <C-e> :NERDTreeToggle<CR>
endif

" Google C++ style file. This needs a symlink in bundle/google.vim/indent:
"   cpp.vim -> google.vim
Plugin 'vim-scripts/google.vim'

" Better status line: use powerline if it is installed, otherwise use airline
if !empty(glob("~/.local/lib/python2.7/site-packages/powerline/bindings/vim"))
    set rtp+=~/.local/lib/python2.7/site-packages/powerline/bindings/vim
    set laststatus=2
    let g:Powerline_symbols='fancy'
elseif !empty(glob("/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim"))
    set rtp+=~/.local/lib/python2.7/site-packages/powerline/bindings/vim
    set laststatus=2
    let g:Powerline_symbols='fancy'
elseif v:version >= 702
    " Use vim-airline
    Plugin 'bling/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
    let g:airline_theme='powerlineish'
    let g:airline#extensions#syntastic#enabled=1
    let g:airline_powerline_fonts=1
    "let g:airline#extensions#tabline#enabled=1
    set laststatus=2
endif

" Better support for git files (commit messages etc.)
Plugin 'tpope/vim-git'

" Smart replace
" Use with %S/... instead of %s/...
Plugin 'tpope/vim-abolish'

" LaTeX support
if $USER!='root'
    Plugin 'lervag/vimtex'
endif

" Sensible.vim - a sensible default configuration
" This provides sane defaults which we can then override or
" extend below.
Plugin 'tpope/vim-sensible'
runtime! plugin/sensible.vim
" Overrides for sensible.vim
set shell=/bin/zsh

" Show the cursor line only in the currently active window
Plugin 'vim-scripts/CursorLineCurrentWindow'
set cursorline

" Encoding
set encoding=utf-8

" Key bindings
" Break out of insert mode using 'jk'
inoremap jk <Esc>

" General settings (also see sensible.vom)
set modeline			" enable modelines
set isk+=_,$,@,%,#  	" not-(word separators)
set noerrorbells		" shut the fuck up!
set novisualbell		" and don't blink either!
set vb
set showmatch 			" show matching brackets
set showcmd             " Show (partial) command in status line.
set nowrapscan          " Avoid automatic wrapping (ensures we notice the 
                        " wrap, can still manually wrap using gg / G). 

" Searching (also see sensible.vim)
set hlsearch 			" do not highlight searched for phrases
set ignorecase          " Do case insensitive matching
set smartcase           " Do smart case matching
" Ctrl-C clears the previous search's highlights
map <C-C> :noh<CR>

" Per project vim files
" This can be used to set tabstops, expandtab etc.
set exrc                " Load the .vimrc file in the current directory
set secure

" Scrolling
set scrolloff=4       " Keep cursor in the middle of the window

" ZSH like completion (also see sensible.vim)
set wildmode=longest:full,full

" Coloring
set t_Co=256
set background=dark
colorscheme blackboard
" Search colors
hi Search guifg=#ffffff guibg=#0000ff gui=none ctermfg=white ctermbg=darkblue 
hi IncSearch guifg=#ffffff guibg=#8888ff gui=none ctermfg=white ctermbg=lightblue cterm=none 
"colorscheme default

" Spell checking
" F7 toggles spell checking for en_us and de_de
if v:version >= 700
    let b:myLang=0
    let g:myLangList=["nospell","en_us","de"]
    function! ToggleSpell()
        let b:myLang=b:myLang+1
        if b:myLang >= len(g:myLangList) | let b:myLang=0 | endif
        if b:myLang==0
            setlocal nospell
        else
            execute "setlocal spell spelllang=".get(g:myLangList,b:myLang)
        endif
        echo "spell checking language: " g:myLangList[b:myLang]
    endfunction
    if !exists("b:myLang")
      if &spell
        let b:myLang=index(g:myLangList,&spelllang)
      else
        let b:myLang=0
      endif
    endif

    nmap <silent> <F6> :call ToggleSpell()<CR>
    imap <F6> <C-o>:call MySpellLang()<CR>

endif

" Calling make
autocmd filetype cpp nnoremap <F5> :w <bar> exec '!make'<CR>
autocmd filetype tex nnoremap <F5> :w <bar> exec '!make'<CR>

" Search files recursively in path
let &path .= ",**"

" Go to the directory of the file when opening
if v:version >= 720
    set autochdir
endif

" Line numbering
highlight LineNr ctermfg=lightgrey ctermbg=black
function CycleLineNumbers()
    if v:version >= 703
        " This should work nicely with vim 7.3 and 7.4
        if (&number==1 && &relativenumber==1)
            :set nonumber
            :set norelativenumber
        elseif (&number==0 && &relativenumber==0)
            :set number
        elseif (&number==1 && &relativenumber==0)
            :set relativenumber
        endif
    else
        " Variant for older vim
        if (&number==1)
            :set nonumber
        else
            :set number
        endif
    endif
endfunction
map <C-m> :call CycleLineNumbers()<CR>
" on by default
set number
if v:version >= 703
    set relativenumber
endif


" Use an external text formater for explicit formating (using 'gq')
if executable('par')
    set formatprg=par\ w76
endif


" Jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" Toggle paste mode
nnoremap <ESC>[80;5u :setlocal paste! paste?<CR>

" Indenting (also see sensible.vim)
set si					" smart indent
" these tab settings are overwritten in indent/ and
" after/ for specific languages and code styles
set tabstop=4			" displayed length of tabs
set softtabstop=4		" seems to be needed as well (~)
set shiftwidth=4		" governs auto indent, >> and << 
set expandtab			" insert stofttabstop whitespaces
" This here is a bit of a mess, see 
" http://vimdoc.sourceforge.net/htmldoc/change.html#fo-table
" a flag is a bit tedious over time
set formatoptions=jcrqwn2b " have the (internal) formatter be as smart as
                        " possible. It would be better to use+=here but for
                        " some reason -=o doesn't work.

" Folding
set foldenable			" turn it on
set foldmethod=syntax " use the syntax files for folding
set foldlevel=20      " start folding at level 20
"set foldmethod=marker " use a special marker to do the folding
"set foldmarker={{{,}}} " use '{{{' to start and '}}}' to end a fold
"set foldlevelstart=0	" do fold by default

" 'updatetime' ms (default=4sec) after cursor has been left unmoved
" (CursorHold), check whether the file has changed and offer to reload it
" (checktime).
au CursorHold * checktime

" Tabs and Splits (tmux: windows and panes)
set splitbelow
set splitright
autocmd VimResized * wincmd =


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The awesome/tmux/vim consistent key bindings. Vim shortcuts starts with Ctrl:
" |         horizontal split
" _         vertical split
" h         go to left split
" j/k/l     go to ...
" H         swap with left split
" J/K/L     swap with ...
" u/i       go to left/right tab
" U/I       move to ...

nnoremap  <C-w><C-v>
inoremap  <C-o><C-w><C-v>
vnoremap  <Esc><C-w><C-v>gv

nnoremap <C-_> <C-w><C-s>
inoremap <C-_> <C-o><C-w><C-s>
vnoremap <C-_> <Esc><C-w><C-s>gv

nnoremap <C-h> <C-w>h
inoremap <C-h> <C-o><C-w>h
vnoremap <C-h> <Esc><C-w>hgv

nnoremap <C-j> <C-w>j
inoremap <C-j> <C-o><C-w>j
vnoremap <C-j> <Esc><C-w>jgv

nnoremap <C-k> <C-w>k
inoremap <C-k> <C-o><C-w>k
vnoremap <C-k> <Esc><C-w>kgv

nnoremap <C-l> <C-w>l
inoremap <C-l> <C-o><C-w>l
vnoremap <C-l> <Esc><C-w>lgv

" These escape sequences require a a special configuration in 
" .Xresources/.Xdefaults to work (otherwise <C-S-x> == <C-x> from vim's POV)
"<C-S-h>
nnoremap <ESC>[72;5u <C-w><S-h>
inoremap <ESC>[72;5u <C-o><C-w><S-h>
vnoremap <ESC>[72;5u <Esc><C-w><S-h>gv

"<C-S-j>
nnoremap <ESC>[74;5u <C-w><S-j>
inoremap <ESC>[74;5u <C-o><C-w><S-j>
vnoremap <ESC>[74;5u <Esc><C-w><S-j>gv

"<C-S-k>
nnoremap <ESC>[75;5u <C-w><S-k>
inoremap <ESC>[75;5u <C-o><C-w><S-k>
vnoremap <ESC>[75;5u <Esc><C-w><S-k>gv

"<C-S-l>
nnoremap <ESC>[76;5u <C-w><S-l>
inoremap <ESC>[76;5u <C-o><C-w><S-l>
vnoremap <ESC>[76;5u <Esc><C-w><S-l>gv

" Resizing of windows (works differently than in awesome WM where
" you resize the master area)
"
" horizontal decrease
nnoremap <C-g> <C-w>10<
inoremap <C-g> <C-o><C-w>10<
vnoremap <C-g> <Esc><C-w>10<gv
" horizontal increase
nnoremap <ESC>[59;5u <C-w>10>
inoremap <ESC>[59;5u <C-o><C-w>10>
vnoremap <ESC>[59;5u <Esc><C-w>10>gv
" vertical decrease
nnoremap <ESC>[47;5u <C-w>10-
inoremap <ESC>[47;5u <C-o><C-w>10-
vnoremap <ESC>[47;5u <Esc><C-w>10-gv
" vertical increase
nnoremap <C-y> <C-w>10+
inoremap <C-y> <C-o><C-w>10+
vnoremap <C-y> <Esc><C-w>10+gv

""""""
" Tabs
nnoremap <C-n> :tabnew<CR>
inoremap <C-n> <C-o>:tabnew<CR>
vnoremap <C-n> <Esc>:tabnew<CR>

nnoremap <C-u> gT
inoremap <C-u> <C-o>gT
vnoremap <C-u> <Esc>gT

nnoremap <C-i> gt
inoremap <C-i> <C-o>gt
vnoremap <C-i> <Esc>gt

"<C-S-u>
"TODO: Doesn't yet work due to URxvt
nnoremap <ESC>[85;5u :tabm -1<CR>
inoremap <ESC>[85;5u <C-o>:tabm -1<CR>gt
vnoremap <ESC>[85;5u <Esc>:tabm -1<CR>gv

"<C-S-i>
nnoremap <ESC>[73;5u :tabm +1<CR>
inoremap <ESC>[73;5u <C-o>:tabm +1<CR>gt
vnoremap <ESC>[73;5u <Esc>:tabm +1<CR>gv
