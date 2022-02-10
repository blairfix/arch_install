# install programs
echo installing core programs

# microcode
#--------------------------------------------------
#pacman -S amd-ucode	    # for amd
pacman -S intel-ucode	    # for intel


# i3
#--------------------------------------------------
pacman -S xorg-server xorg-xinit		# xorg server
pacman -S i3 i3-wm i3blocks i3lock i3status	# i3
pacman -S light					# screen brightness button
chmod +s /usr/bin/light


# utilities
#--------------------------------------------------
pacman -S firefox	    # internet
pacman -S fzf		    # fuzzy finder for terminal
pacman -S alacritty	    # terminal emulator
pacman -S htop		    # htop
pacman -S trash-cli	    # trash client
pacman -S git		    # version control
pacman -S xdotool	    # press keys using cli
pacman -S gprename	    # batch rename
pacman -S man-db man-pages  # manual database
pacman -S yay		    # installer for AUR

# dropbox
#--------------------------------------------------
pacman -S python-dropbox # dropbox
#dropbox autostart n	    # turn off dropbox autostart

# rclone
pacman -S rclone
#rclong config
#name = remote




# server
#--------------------------------------------------
pacman -S openssh			# ssh
pacman -S openssh-server		# ssh server
pacman -S sshpass			# for using rsh keys


# text manipulation
#--------------------------------------------------
pacman -S neovim gvim		# vim
pacman -S texlive-core		# latex
pacman -S texlive-bibtexextra	# bibtex
pacman -S texstudio		# texstudio
pacman -S xclip			# xclip clipboard
pacman -S source-highlight	# highlight code for html
pacman -S pdfgrep		# grep from pdfs
pacman -S pandoc pandoc-eqnos	# pandoc

# reading
#--------------------------------------------------
pacman -S calibre	    # ebook reader
pacman -S okular	    # heavy pdf reader
pacman -S mupdf		    # light pdf reader


# images
#--------------------------------------------------
pacman -S feh		    # image viewer
pacman -S inkscape	    # edit vector images
pacman -S pngquant	    # compress png
pacman -S gimp		    # image editor
pacman -S jpegoptim	    # compress jpeg
pacman -S imagemagick	    # image conversion


# audio and video
#--------------------------------------------------
pacman -S audacity	    # edit audio
pacman -S kazam		    # screen capture
pacman -S cheese	    # test camera
pacman -S ffmpeg	    # cli audio video editor


# finance
#--------------------------------------------------
pacman -S gnucash	    # accounting software


# from AUR
#--------------------------------------------------
yay -S proselint	    # writing linter
yay -S ssmtp		    # email
yay -S ttf-ms-fonts	    # microsoft fonts

