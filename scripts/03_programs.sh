# install programs
echo installing core programs

# microcode
#--------------------------------------------------
pacman -S amd-ucode	    # for amd
pacman -S intel-ucode	    # for intel


# i3
#--------------------------------------------------
pacman -S xorg-server				# xorg gui
pacman -S i3 i3-wm i3blocks i3lock i3status	# i3
pacman -S light					# screen brightness button
sudo chmod +s /usr/bin/light


# utilities
#--------------------------------------------------
pacman -S firefox	    # internet
pacman -S fzf		    # fuzzy finder for terminal
pacman -S htop		    # htop
pacman -S ssmtp		    # ssmtp email
pacman -S trash-cli	    # trash client
pacman -S git		    # version control
pacman -S xdotool	    # press keys using cli
pacman -S gprename	    # batch rename
pacman -S python3-gpg dropbox # dropbox
dropbox autostart n	    # turn off dropbox autostart



# server
#--------------------------------------------------
pacman -S openssh-server		# ssh server
pacman -S sshpass			# for using rsh keys
curl https://rclone.org/install.sh | sudo bash  # rclone
#rclong config
#name = remote


# text manipulation
#--------------------------------------------------
pacman -S vim nvim	    # vim
pacman -S texlive-full	    # latex
pacman -S texstudio	    # texstudio
pacman -S pandoc	    # pandoc
pacman -S pandoc-citeproc   # citeproc
pacman -S xclip		    # xclip clipboard
pacman -S source-highlight  # highlight code for html
pacman -S python3-proselint # lint your writing
pacman -S ttf-mscorefonts-installer # fonts package
pacman -S pdfgrep	    # grep from pdfs

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
pacman -S Imagemagick	    # image conversion


# audio and video
#--------------------------------------------------
pacman -S audacity	    # edit audio
pacman -S kazam		    # screen capture
pacman -S cheese	    # test camera
pacman -S ffmpeg	    # cli audio video editor


# finance
#--------------------------------------------------
pacman -S gnucash	    # accounting software



