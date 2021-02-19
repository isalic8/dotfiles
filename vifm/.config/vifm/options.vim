set vicmd=nvim
set syscalls
set trash
set nofollowlinks
set sortnumbers
set history=100
set undolevels=100
set novimhelp
set norunexec
colorscheme dracula
set wildmenu
set wildstyle=popup
set suggestoptions=normal,visual,view,otherpane,keys,marks,registers
set ignorecase
set smartcase
set nohlsearch
set incsearch
set scrolloff=4
set timefmt=%m/%d\ %H:%M
" What should be saved automatically between vifm runs
set vifminfo=dhistory,savedirs,chistory,state,tui,shistory,
    \phistory,fhistory,dirstack,registers,bookmarks,bmarks
" Don't do too many requests to slow file systems
if !has('win')
    set slowfs=curlftpfs
endif
" Set custom status line look
set statusline="  Hint: %z%= %A %10u:%-7g %15s %20d  "
