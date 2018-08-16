"
" .vimrc: https://github.com/nekipelov/dotfiles
" authro: Alex Nekipelov (alex@nekipelov.net)
"

" Plugin settings
let g:NERDCustomDelimiters = {'cpp': { 'left': '//', 'leftAlt': 'REM ' }}

" vundle
set nocompatible 
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Valloric/YouCompleteMe'
Plugin 'https://github.com/vim-scripts/OmniCppComplete'
Plugin 'bling/vim-bufferline'
Plugin 'scrooloose/syntastic'
Plugin 'vim-cpp-auto-include'
"Plugin 'Acpp'
Plugin 'cpp.vim'
Plugin 'https://github.com/scrooloose/nerdcommenter.git'
"Plugin 'https://github.com/sjbach/lusty.git'
Plugin 'https://github.com/tpope/vim-endwise.git'
Plugin 'https://github.com/thinca/vim-localrc.git'
Plugin 'https://github.com/xaizek/vim-inccomplete'
Plugin 'https://github.com/vim-scripts/BufOnly.vim.git'
Plugin 'https://github.com/jeetsukumaran/vim-buffergator.git'
Plugin 'https://github.com/scrooloose/nerdtree.git'
Plugin 'https://github.com/Xuyuanp/nerdtree-git-plugin.git'
Plugin 'https://github.com/ntpeters/vim-better-whitespace.git'
Plugin 'https://github.com/bkad/CamelCaseMotion.git'
Plugin 'https://github.com/othree/eregex.vim.git'
Plugin 'https://github.com/ConradIrwin/vim-bracketed-paste.git'
Plugin 'https://github.com/majutsushi/tagbar.git'
Plugin 'https://github.com/rking/ag.vim.git'
Plugin 'https://github.com/kien/ctrlp.vim.git'
Plugin 'https://github.com/junegunn/fzf'
Plugin 'https://github.com/tpope/vim-unimpaired.git'
Plugin 'https://github.com/easymotion/vim-easymotion.git'

" colors
Plugin 'damage220/solas.vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'mhartington/oceanic-next'
Plugin 'https://github.com/jonathanfilip/vim-lucius.git'
Plugin 'https://github.com/altercation/vim-colors-solarized.git'


" TODO
" http://vimawesome.com/

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
    

" make
map <F9> :wa<CR>:make!<CR>
imap <F9> <Esc>:wa<CR>:make!<CR>

"Vim-incomplete
let g:inccomplete_showdirs = 1
let g:inccomplete_addclosebracket = ""

" String to put at the start of lines that have been wrapped
set showbreak=+

filetype plugin on
filetype indent on

" <F2> saves current buffer
nmap <F2> :w<CR>
imap <F2> <C-O>:w<CR>


" Undo in insert mode.
imap <c-z> <c-o>u

" Type (in the insert-mode) 4+4<C-B> and you will get the result.
"  Note: '<C-A>' won't work under screen because C-A C-A is a default
" Keybinding of screen *g*
" '*' == sum|'+' == product
" '-' == difference|'/' == quotient
" '%' == remainder|'^' == scale(a^b) = min(scale(a)*b
inoremap <C-B> <C-O>yiW<End>=<C-R>=<C-R>0<CR>

" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
set softtabstop=4

" line height
set colorcolumn=100
"highlight ColorColumn ctermbg=darkgray

" relative line numbers
set relativenumber
" print current line number
set number
"highlight CursorLineNr ctermfg=grey ctermbg=grey

" higlight current line
"set cursorline
hi CursorLine   cterm=NONE ctermbg=darkgray ctermfg=white guibg=darkgray guifg=white
hi CursorColumn cterm=NONE ctermbg=darkgray ctermfg=white guibg=darkgray guifg=white

set background=dark
colorscheme solarized
"colorscheme lucius
"LuciusDarkHighContrast
"LuciusLightHighContrast

" search vimrc in current directory
set exrc
set secure

" switch to buffers without save
set hidden 

" include path
set path+=.,"/usr/include/"
if isdirectory('/usr/include/c++/4.9')
    set path+=/usr/include/c++/4.9
elseif isdirectory('/usr/include/c++/4.8')
    set path+=/usr/include/c++/4.8
elseif isdirectory('/usr/include/c++/4.7')
    set path+=/usr/include/c++/4.7
elseif isdirectory('/usr/include/c++/4.6')
    set path+=/usr/include/c++/4.6
endif

" extra spaces
highlight ExtraWhitespace ctermbg=gray guibg=gray
match ExtraWhitespace /\s\+$/


" vim-airline
let g:airline#extensions#tabline#enabled = 1
"let g:airline_enable_fugitive=1
let g:airline_enable_syntastic=1
let g:airline_enable_bufferline=1
"let g:airline_theme='dark'
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'
set laststatus=2


" plugins

" switch between header and implementation (.cpp/.h).
so ~/.vim/plugins/a.vim
map <F4> :A<CR>

" NerdComment
nmap <C-.>          :call NERDComment('n', 'toggle')<CR>
xmap <C-.>          :call NERDComment('x', 'toggle')<CR>

" NerdTree
nmap <Leader>n          :NERDTreeToggle<CR>
xmap <Leader>n          :NERDTreeToggle<CR>
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'


" Replace word under cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>

" git grep word under cursor 
"nnoremap <Leader>f :Ggrep -w <C-r><C-w>

" Higlight word under cursor
autocmd CursorMoved * exe printf('match Search /\V\<%s\>/', escape(expand('<cword>'), '/\'))

" replace current word to yanked text
nnoremap S "_diwP

" autogenerate tags
"au BufWritePost *.c,*.cpp,*.h silent! !ctags -R &

" tag files
set tags+=~/.vim/stl_tags;

" build tags of your own project with Ctrl-F12
map <F12> :!ctags -f tags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q -I  _GLIBCXX_NOEXCEPT .<CR>

set nocp 
filetype plugin on
syntax on
set filetype=cpp

" higlight search
set hlsearch
set incsearch


" switch tab by alt+num
for c in range(1, 9)
    exec "set <A-".c.">=\e".c
    exec "map \e".c." <A-".c.">"

    let n = c - '0'
    exec "map <M-". n ."> ". n ."gt"
endfor


" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 2
"let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
" also necessary for fixing LIBSTDC++ releated stuff
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD", "boost"]
" automatically open and close the popup menu / preview window
"au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
"autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"set completeopt=menuone,menu,longest,preview
set completeopt-=preview


"tmp!
autocmd FileType cpp set omnifunc=cppcomplete#CompleteCPP
au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main

" YouCompleteMe
let g:ycm_confirm_extra_conf = 0
let g:syntastic_always_populate_loc_list = 1
ret g:ycm_collect_identifiers_from_tags_files = 1


"CamelCaseMotion
"map m <Plug>CamelCaseMotion_w
"map ? <Plug>CamelCaseMotion_b


" Vim Better Whitespace
highlight ExtraWhitespace ctermbg=red


" eregex plugin
nnoremap <leader>/ :call eregex#toggle()<CR>
let g:eregex_default_enable = 0

" ag plugin
" start searching from your project root
"let g:ag_working_path_mode="r"

" CtrlP plugin
let g:ctrlp_map = '<Leader>p'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_extensions = ['tag', 'buffertag', 'dir']
            let g:ctrlp_custom_ignore = {
                \ 'dir':  '\.git$\|\.hg$\|\.svn$',
                \ 'file': '\.o$' }

" don't sort by name
let g:tagbar_sort = 0
nmap <F8> :TagbarToggle<CR>

"""" NerdCommenter
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

""" EasyMotion

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" z{char}{char} to move to {char}{char}
nmap z <Plug>(easymotion-overwin-f2)

" higlight <..> pair for C++ templates
au FileType cpp set matchpairs+=<:>


" :W sudo saves the file
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

" Minimal number of screen lines to keep above and below the cursor
set scrolloff=10

" Ignore files
set wildignore=*.o,*~,*.pyc
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*


" Persistent undo
if has('persistent_undo')
    set undofile                " Save undo's after file closes
    set undodir=$HOME/.vim/undo " where to save undo histories
    set undolevels=1000         " How many undos
    set undoreload=10000        " number of lines to save for undo
endif

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" allow the . to execute once for each line of a visual selection
vnoremap . :normal .<CR>

" next/prev error
nmap <C-n>           :cn<CR>
nmap <C-p>           :cp<CR>

" wild menu
set wildmenu


let g:charset_is_cp1251 = 0
function! ToggleCharset()
    if g:charset_is_cp1251
        let g:charset_is_cp1251 = 0
         e ++enc=utf-8
    else
        let g:charset_is_cp1251 = 1
         e ++enc=cp1251
    endif
endfunction
nmap <F3> :call ToggleCharset()<CR>


let g:fugitive_git_grep_options='-n --no-color --recurse-submodules'

set backspace=indent,eol,start
