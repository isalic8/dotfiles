" :com[mand][!] command_name action
" The following macros can be used in a command
" %a is replaced with the user arguments.
" %c the current file under the cursor.
" %C the current file under the cursor in the other directory.
" %f the current selected file, or files.
" %F the current selected file, or files in the other directory.
" %b same as %f %F.
" %d the current directory name.
" %D the other window directory name.
" %m run the command in a menu window

" Commands
command! df df -h %m 2> /dev/null
command! du du -hd0 %f %m 2> /dev/null
command! diff vim -d %f %f
command! zip zip -r %f.zip %f
command! run !! ./%f
command! make !!make "%a"
command! mkcd :mkdir "%a" | cd "%a"
command! vgrep vim "+grep %a"
command! reload :write | restart
command! FZFlocate :set noquickview | :execute 'goto' fnameescape(term('find $HOME | fzf --height 15 2>/dev/tty'))
command! FZFfind :set noquickview | :execute 'goto' fnameescape(term('find | fzf --height 15 2>/dev/tty'))
command! dd :!dd-iso %f
command! mount :!mount.sh %f
"nmap bg :!feh --bg-scale %f<cr>
nmap bg :!feh --bg-fill %f<cr>
nmap ,c :!c %f<cr>
nmap ,x :!x %f<cr>
nmap ,q :quit<cr>
nmap q :quit<cr>
nmap S :sort<cr>
nmap w :view<cr>
vnoremap w :view<cr>gv
" Open file in the background using its default program
nmap gb :file &<cr>l
" Yank current directory path into the clipboard
nmap yd :!echo %d | xclip -selection clipboard %i<cr>
" Yank current file path into the clipboard
nmap yf :!echo %c:p | xclip -selection clipboard %i<cr>
" Mappings for faster renaming
nmap I cw<c-a>
nmap cc cw<c-u>
nmap A cw
" Open console in current directory
nmap ,t :!st &<cr>
" Toggle wrap setting on ,w key
nmap ,w :set wrap!<cr>
" Example of standard two-panel file managers mappings
nmap v :!less %f<cr>
nmap e :edit<cr>
nmap <f5> :copy<cr>
nmap <f6> :move<cr>
nmap md :mkdir<space>
nmap mf :touch<space>
nmap <f8> :delete<cr>
nmap s <nop>
nmap sv :vs<cr>
nmap so :only<cr>
nmap sh :sp<cr>
" Start shell in current directory
nmap ,s :shell<cr>
nmap <Space> t<Down>
nmap x yy<Down>
map > :!vifmimg inc<CR>
map < :!vifmimg dec<CR>
map f :FZFfind<CR>
map F :FZFlocate<CR>
"Pane resize
nmap - <C-w>5<
nmap = <C-w>5>

"Movement
map gh :cd $HOME<CR>
map g/ :cd /<CR>
map ge :cd /etc<CR>
map gt :cd /tmp<CR>
map gM :cd /mnt<CR>
map gs :cd /srv<CR>
map gr. :cd /run<CR>
map grm :cd /run/media/<CR>
map go :cd /opt<CR>
map gm :cd /media<CR>
map gu. :cd /usr<CR>
map gus :cd /usr/share<CR>
map gl :cd ~/.local<CR>
map gls :cd ~/.local/share<CR>
map glm :cd ~/.local/share<CR>
"Personal
map gd :cd ~/dox<CR>
map gdd :cd ~/.dotfiles<CR>
map gD :cd ~/downloads<CR>
map gH :cd /media/hdd<CR>
map gb :cd ~/.bin<CR>
map gw :cd ~/.wine<CR>
map gc :cd ~/.config<CR>
