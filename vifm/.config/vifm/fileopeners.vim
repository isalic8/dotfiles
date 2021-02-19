" Pdf
filextype *.pdf setsid -f zathura %c %i &, apvlv %c, xpdf %c
fileviewer *.pdf pdftotext -nopgbrk %c -

" PostScript
filextype *.ps,*.eps,*.ps.gz
        \ {View in zathura}
        \ setsid -f zathura %f &,

" Djvu
filextype *.djvu
        \ {View in zathura}
        \ setsid -f zathura %f &,

filetype *.html,*.htm w3m, lynx

" Object
filetype *.o nm %f | less

" Man page
filetype *.[1-8] man ./%c
fileviewer *.[1-8] man ./%c | col -b

" Images
filextype *.bmp,*.jpg,*.jpeg,*.png,*.xpm
        \ {View in sxiv}
        \ o %f &>/dev/null,

filextype *.gif
        \ o %f &>/dev/null,

" OpenRaster
filextype *.ora
        \ {Edit in MyPaint}
        \ setsid -f mypaint %f &,

" Mindmap
filextype *.vym
        \ {Open with VYM}
        \ setsid -f vym %f &,

" MD5
filetype *.md5
       \ {Check MD5 hash sum}
       \ md5sum -c %f %S,

" SHA1
filetype *.sha1
       \ {Check SHA1 hash sum}
       \ sha1sum -c %f %S,

" SHA256
filetype *.sha256
       \ {Check SHA256 hash sum}
       \ sha256sum -c %f %S,

" SHA512
filetype *.sha512
       \ {Check SHA512 hash sum}
       \ sha512sum -c %f %S,

" GPG signature
filetype *.asc
       \ {Check signature}
       \ !!gpg --verify %c,

" Torrent
filetype *.torrent ktorrent %f &
fileviewer *.torrent dumptorrent -v %c

" FuseZipMount
filetype *.zip,*.jar,*.war,*.ear,*.oxt,*.apkg
       \ {Mount with fuse-zip}
       \ FUSE_MOUNT|fuse-zip %SOURCE_FILE %DESTINATION_DIR,
       \ {View contents}
       \ zip -sf %c | less,
       \ {Extract here}
       \ tar -xf %c,
fileviewer *.zip,*.jar,*.war,*.ear,*.oxt zip -sf %c

" ArchiveMount
filetype *.tar,*.tar.bz2,*.tbz2,*.tgz,*.tar.gz,*.tar.xz,*.txz
       \ {Mount with archivemount}
       \ FUSE_MOUNT|archivemount %SOURCE_FILE %DESTINATION_DIR,

" Rar2FsMount and rar archives
filetype *.rar
       \ {Mount with rar2fs}
       \ FUSE_MOUNT|rar2fs %SOURCE_FILE %DESTINATION_DIR,
fileviewer *.rar unrar v %c

" IsoMount
filetype *.iso
       \ {Mount with fuseiso}
       \ FUSE_MOUNT|fuseiso %SOURCE_FILE %DESTINATION_DIR,

" SshMount
filetype *.ssh
       \ {Mount with sshfs}
       \ FUSE_MOUNT2|sshfs %PARAM %DESTINATION_DIR %FOREGROUND,

" FtpMount
filetype *.ftp
       \ {Mount with curlftpfs}
       \ FUSE_MOUNT2|curlftpfs -o ftp_port=-,,disable_eprt %PARAM %DESTINATION_DIR %FOREGROUND,

" Fuse7z and 7z archives
filetype *.7z
       \ {Mount with fuse-7z}
       \ FUSE_MOUNT|fuse-7z %SOURCE_FILE %DESTINATION_DIR,
fileviewer *.7z 7z l %c

" TuDu files
filetype *.tudu tudu -f %c

" Qt projects
filextype *.pro qtcreator %f &

" Video
filextype *.avi,*.mp4,*.wmv,*.dat,*.3gp,*.ogv,*.mkv,*.mpg,*.mpeg,*.vob,*.flac,
         \*.fl[icv],*.m2v,*.mov,*.webm,*.ts,*.mts,*.m4v,*.r[am],*.qt,*.divx,*.as[fx]
	 \ o %f &>/dev/null & echo "Opening file..." ; sleep 1s,

"Audio
filextype *.flac,*.mp3,*.ogg
	 \ o %f &>/dev/null & echo "Opening file..." ; sleep 1s,

" Office files
filextype *.odt,*.doc,*.docx,*.xls,*.xlsx,*.odp,*.pptx setsid -f libreoffice %f &
fileviewer *.doc catdoc %c
fileviewer *.docx docx2txt.pl %f -

" Video files
fileviewer *.avi,*.mp4,*.wmv,*.dat,*.3gp,*.ogv,*.mkv,*.mpg,*.mpeg,*.vob,
	\*.fl[icv],*.m2v,*.mov,*.webm,*.ts,*.mts,*.m4v,*.r[am],*.qt,*.divx,
	\ vifmimg videopreview %px %py %pw %ph %c
	\ %pc
	\ vifmimg clear

" Image files
fileviewer *.bmp,*.jpg,*.jpeg,*.png,*.xpm
	\ vifmimg draw %px %py %pw %ph %c
	\ %pc
	\ vifmimg clear

" Icons
fileviewer *.ico
	\ vifmimg magickpreview %px %py %pw %ph %c
	\ %pc
	\ vifmimg clear

" Gifs
fileviewer *.gif
	\ vifmimg gifpreview %px %py %pw %ph %c
	\ %pc
	\ vifmimg clear
	

" Archives
fileviewer *.tgz,*.tar.gz tar -tzf %c
fileviewer *.tar.bz2,*.tbz2 tar -tjf %c
fileviewer *.tar.txz,*.txz xz --list %c
fileviewer *.tar tar -tf %c

"fileviewer <font/*>
	"\ vifmimg fontpreview %px %py %pw %ph %c
	"\ %pc
	"\ vifmimg clear

"fileviewer *.pdf
	"\ vifmimg pdfpreview %px %py %pw %ph %c
	"\ %pc
	"\ vifmimg clear

"fileviewer <audio/*>
	"\ vifmimg audiopreview %px %py %pw %ph %c
	"\ %pc
	"\ vifmimg clear
	
"fileviewer *.epub
	"\ vifmimg epubpreview %px %py %pw %ph %c
	"\ %pc
	"\ vifmimg clear
