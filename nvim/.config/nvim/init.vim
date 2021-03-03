"--Automatically installs vim-plug + pluggins
if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
echo "Downloading junegunn/vim-plug to manage plugins..."
silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
autocmd VimEnter * PlugInstall
"CocInstall coc-json coc-tsserver coc-html coc-sh coc-pyright
endif

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
Plug 'junegunn/goyo.vim' "Goyo minimal UI plugin
Plug 'vim-scripts/Rename2' "Rename files 
Plug 'scrooloose/nerdcommenter' "Comment/Uncomment lines
Plug 'tomasiser/vim-code-dark' "Theme
Plug 'dracula/vim', { 'as': 'dracula' } "Dracula theme
Plug 'itchyny/lightline.vim' "Custom statusline
Plug 'Raimondi/delimitMate' "Automatic closing brackets, quotes, parenthesis
Plug 'easymotion/vim-easymotion' "Vim motion on speed
Plug 'preservim/nerdtree' "File explorer
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } "Fzf intergration
Plug 'junegunn/fzf.vim' "Fzf intergration
Plug 'tpope/vim-obsession' "Simple session management utility
Plug 'lilydjwg/colorizer' "Vim colors
Plug 'ryanoasis/vim-devicons' "Dev icons
"Plug 'vim-scripts/AutoComplPop'
Plug 'neoclide/coc.nvim', {'branch': 'release'} "Vim autocompletion and syntax stuff
Plug 'mattn/emmet-vim' "Html completion
Plug 'voldikss/vim-floaterm' "Floating terminal
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown'} "Live markdown viewer
call plug#end()

"--General settings
let mapleader = "," 
let skip_defaults_vim=1
"set number relativenumber
"set number 
set lazyredraw
set nonumber
set path=.,,**
set autochdir
set incsearch
set ignorecase
set smartcase
set encoding=utf-8
set viminfo=""
let $PAGER=''
filetype plugin on
syntax on
set splitbelow
set splitright
set t_Co=256
set t_ut=
"colorscheme codedark
colorscheme dracula
"Hiding vim ui
"set noshowmode
"set noruler
"set laststatus=0
"set noshowcmd
"set cmdheight=1
"Change tabbing width
set tabstop=4
set shiftwidth=4
"Fix tmux colors
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
endif



"--Folding
"augroup remember_folds
"augroup AutoSaveFolds
	"autocmd!
	"" view files are about 500 bytes
	"" bufleave but not bufwinleave captures closing 2nd tab
	"" nested is needed by bufwrite* (if triggered via other autocmd)
	"autocmd BufWinLeave,BufLeave,BufWritePost ?* nested silent! mkview!
	"autocmd BufWinEnter ?* silent! loadview
"augroup end
"set foldmethod=manual
"set foldclose=all
"set viewoptions=folds,cursor
"set sessionoptions=blank,buffers,curdir,folds,help,options,tabpages,winsize

"--Easy motion Plugin
map s <NOP>
map s <Plug>(easymotion-prefix)

"--Nerd Comment Plugin
map <leader>c<space> NERDComToggleComment

"--Colorize Plugin
let g:colorizer_maxlines = 1000

"--Goyo Plugin
map <leader>g :Goyo<enter>
autocmd! User GoyoEnter 
autocmd! User GoyoLeave

"--Lightline Status Bar Plugin
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

"--Nerd Tree Plugin
map <leader>f :NERDTreeToggle<CR>
"autocmd vimenter * NERDTree
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnted * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") && v:this_session == "" | NERDTree | endif
"autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '-'
let g:NERDTreeDirArrowCollapsible = '|'

"--Emmet Plugin
",e,
let g:user_emmet_install_global = 0
autocmd FileType html,css,php EmmetInstall
let g:user_emmet_leader_key=',e'

"--Coc Plugin
"TextEdit might fail if hidden is not set.
set hidden
"Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
"Give more space for displaying messages.
"set cmdheight=2
"Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
"delays and poor user experience.
set updatetime=300
"Don't pass messages to |ins-completion-menu|.
set shortmess+=c

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"--Notes grep
command! -nargs=1 Ngrep vimgrep "<args>" $NOTES/*/*.*md
nnoremap <leader>[ :Ngrep<space>
nmap <c-n> :cnext<enter>
nmap <c-p> :cprev<enter>

"--Wordcount
command! WC !wc %

"--Color column
"F1 creates colored line at the 80th column
command! ToggleCC :let &cc = &cc == '' ? '80' : ''
imap <F1> <NOP>
nmap <F1> <NOP>
imap<F1> <esc>:let &cc = &cc == '' ? '80' : ''<CR>
nmap<F1> :let &cc = &cc == '' ? '80' : ''<CR>

"--Filetype detect
command! Fd :filetype detect

"--Chmod
command! Ch :!chmod +x %

"--Hidden statusline
let s:hidden_all = 0
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
    endif
endfunction
nnoremap <C-s> :call ToggleHiddenAll()<CR>


"--Case change
"Use tilda (~) to change the case of characters in vmode/nmode
function! TwiddleCase(str)
  if a:str ==# toupper(a:str)
    let result = tolower(a:str)
  elseif a:str ==# tolower(a:str)
    let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
  else
    let result = toupper(a:str)
  endif
  return result
endfunction
vnoremap ~ y:call setreg('', TwiddleCase(@"), getregtype(''))<CR>gv""Pgv

"--Terminal split
"command! T :5sp term://zsh
"Noremap for neovim terminal mode
tnoremap <ESC> <C-\><C-n>

"--Float term
noremap  <leader>t :FloatermToggle<CR>
noremap! <leader>t <Esc>:FloatermToggle<CR>
tnoremap <leader>t <C-\><C-n>:FloatermToggle<CR>
let g:floaterm_width = 100
let g:floaterm_winblend = 0

"--Markdown plugin
let g:instant_markdown_autostart = 0
let g:instant_markdown_slow = 1
"let g:instant_markdown_port = 8080
"let g:instant_markdown_browser = "librewolf.appimage --new-window"
let g:instant_markdown_browser = "firefox"

"--Macros
"File saving/quiting
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!
imap <leader>w <ESC>:w<Enter>
imap <leader>q <ESC>:q!
nmap <leader>w :w<enter>
nmap <leader>q :q!
nmap <silent> <leader>d :q!<enter>
"Copy and paste to and from clipboard
imap <leader>xp <esc>"+p
vmap <leader>xy "+y
"Enable file compilation on all filetypes
autocmd FileType * nmap <leader>ac :!compiler<space><c-r>%<enter>
"Misc macros
map # <NOP>
nmap <F2> :set spell! spelllang=en_us<enter>
imap <F3> <C-R>=strftime('%d %B %Y')<C-M>
imap <F4> <C-R>=strftime('%d-%B-%Y')<C-M>
nmap <space><space>; <esc>/<++><enter>"_c4l
"Spell checking
nmap z, z=
nmap s. ]s
nmap s, [s
"Tab movement
nmap <Tab> gt
nmap <A-Tab> gT
nmap <silent> <A-t> :tabnew<CR>
nmap <silent> <A-1> :tabmove -<CR>
nmap <silent> <A-2> :tabmove +<CR>
"Pane navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
"Pane resizing
nnoremap <silent> = :vertical resize +10<CR>
nnoremap <silent> - :vertical resize -10<CR>
nnoremap <silent> + :resize +10<CR>
nnoremap <silent> _ :resize -10<CR>
"Groff
au BufRead,BufNewFile *.ms set filetype=ms
"Compile and view
autocmd FileType ms nmap <leader>ac :!groff<space>-ms<space>-e<space><c-r>%<space>-T<space>pdf<space>><space><c-r>%<backspace><backspace>pdf<enter><enter>
autocmd FileType ms nmap <leader>av :!zathura<space><c-r>%<backspace><backspace>pdf<space>&<enter><enter>
"Formatting
autocmd FileType ms imap <leader>eq .EQ<Enter><Enter>.EN<ESC>1ki
autocmd FileType ms imap <leader>ab .AB<Enter><Enter>.AN<ESC>1ki
autocmd FileType ms imap <leader>p .PP<Enter>
autocmd FileType ms imap <leader>ol .IP \(bu<Enter>
autocmd FileType ms imap <leader>ul .IP<Enter>
autocmd FileType ms imap <leader>b .B<space>
autocmd FileType ms imap <leader>i .I<space>
autocmd FileType ms imap <leader>bi .BI<space>

"Markdown
au BufRead,BufNewFile *.md set filetype=md
autocmd FileType md nmap <leader>av :!zathura<space><c-r>%<backspace><backspace>pdf<space>&<enter><enter>

"LaTeX
au BufRead,BufNewFile *.tex set filetype=tex
autocmd FileType tex nmap <leader>av :!zathura<space><c-r>%<backspace><backspace><backspace>pdf<space>&<enter><enter>

autocmd vimenter * wincmd l
autocmd vimenter * filetype detect
autocmd BufWrite ~/.Xresources !xrdb -load ~/.Xresources && xrdb -load ~/.Xresources
