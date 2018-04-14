" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" Set code folding
set foldenable
set foldmethod=syntax
set foldlevel=99
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>


" Disabled VIM compatibility mode
if &compatible
  set nocompatible
end

"************************ Support for vundle Start *************************
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle
Bundle 'gmarik/vundle'

" Original repos on github
Bundle 'tomasr/molokai'
Bundle 'sjl/gundo.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'mbriggs/mark.vim'
Bundle 'danro/rename.vim'
Bundle 't9md/vim-quickhl'
Bundle 'majutsushi/tagbar'
Bundle 'Raimondi/delimitMate'
Bundle 'jiangmiao/auto-pairs'
Bundle 'tacahiroy/ctrlp-funky'
Bundle 'vim-scripts/ctags.vim'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'Valloric/ListToggle'
"Bundle 'scrooloose/syntastic'
"Bundle 'scrooloose/nerdcommenter'
"Bundle 'vim-scripts/tComment'

" vim-scripts repos
Bundle 'a.vim'
Bundle 'vcscommand.vim'
Bundle 'ShowPairs'
Bundle 'SudoEdit.vim'
Bundle 'EasyGrep'
Bundle 'VOoM'
Bundle 'VimIM'
"Bundle 'taglist.vim'
Bundle 'The-NERD-tree'
Bundle 'The-NERD-Commenter'

" non github repos
" Bundle 'git://git.wincent.com/command-t.git'
filetype plugin indent on

" Set mapleader
let mapleader=","

" Config The-NERD-tree.vim
let NERDTreeWinSize=25
let NERDTreeMinimalUI=1
let NERDChristmasTree=1
let NERDTreeWinPos='left'
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$']

autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
nmap <F5> :NERDTreeToggle<cr>

" Config taglist.vim
"let Tlist_WinWidth=25
"let Tlist_Show_One_File=1
"let Tlist_Exit_OnlyWindow=1
"let Tlist_Use_Right_Window=1
"let Tlist_GainFocus_On_ToggleOpen=1
"let Tlist_Ctags_Cmd='/usr/bin/ctags'
"map <F6> :TlistToggle<cr>

" Config tagbar
let g:tagbar_width=25
let g:tagbar_autofocus=1
let g:tagbar_ctags_bin='/usr/bin/ctags'
nmap <F6> :TagbarToggle<CR>

" Config Syntastic
"let g:syntastic_auto_jump=1
"let g:syntastic_check_on_wq=0
"let g:syntastic_enable_signs=1
"let g:syntastic_auto_loc_list=1
"let g:syntastic_check_on_open=1
"let g:syntastic_enable_balloons=1
"let g:syntastic_loc_list_height=5
"let g:syntastic_error_symbol='✗'
"let g:syntastic_warning_symbol='⚠'
"let g:syntastic_enable_highlighting=0
"let g:syntastic_always_populate_loc_list=1

" Config trailing whitespace
map <leader>x :FixWhitespace<CR>

" Config rainbow parentheses
let g:rbpt_colorpairs = [
        \ ['brown',       'RoyalBlue3'],
        \ ['Darkblue',    'SeaGreen3'],
        \ ['darkgray',    'DarkOrchid3'],
        \ ['darkgreen',   'firebrick3'],
        \ ['darkcyan',    'RoyalBlue3'],
        \ ['darkred',     'SeaGreen3'],
        \ ['darkmagenta', 'DarkOrchid3'],
        \ ['brown',       'firebrick3'],
        \ ['gray',        'RoyalBlue3'],
        \ ['darkmagenta', 'DarkOrchid3'],
        \ ['Darkblue',    'firebrick3'],
        \ ['darkgreen',   'RoyalBlue3'],
        \ ['darkcyan',    'SeaGreen3'],
        \ ['darkred',     'DarkOrchid3'],
        \ ['red',         'firebrick3'],
        \ ]

let g:rbpt_max=16
let g:rbpt_loadcmd_toggle=0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
"au Syntax * RainbowParenthesesLoadChevrons
"au Syntax * RainbowParenthesesLoadBraces	"And code folding conflict

" Config ctrlp.vim
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=8
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.png,*.jpg,*.gif

" Config ctrlp-funky
nnoremap <Leader>fu :CtrlPFunky<Cr>
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
let g:ctrlp_funky_syntax_highlight=1
let g:ctrlp_extensions = ['funky']

" Config The-NERD-Commenter
let NERDSpaceDelims=1
let NERDCompactSexyComs=1

" Config EasyGrep
let g:EasyGrepMode=2
let g:EasyGrepCommand=0
let g:EasyGrepRecursive=0
let g:EasyGrepIgnoreCase=0
let g:EasyGrepFilesToExclude="*.bak, *~, cscope.*, *.a, *.o, *.pyc, *.bak"

" Config molokai
"set background=light
"set t_Co=256

"************************** Vundle End ***************************************
