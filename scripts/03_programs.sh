
# install programs
echo installing core programs


# microcode
#--------------------------------------------------
echo "Which version of microcode do you want? (amd, intel)"
read micro

if [ $micro == "amd" ] 
then
    # amd microcode
    pacman -S amd-ucode	    
else
    # intel microcode
    pacman -S intel-ucode	   
fi



# xorg, i3 and light
#--------------------------------------------------
pacman -S xorg-server \
          xorg-xinit \
          i3 \
          i3-wm \
	  i3blocks \
	  i3lock \
	  i3status \
	  light

chmod +s /usr/bin/light



# core programs
#--------------------------------------------------
pacman -S firefox \
	  fzf \
	  alacritty \
	  htop \
	  trash-cli \
	  man-db man-pages



# ssh 
#--------------------------------------------------
pacman -S openssh \
	  openssh-server \
	  sshpass



# latex
#--------------------------------------------------
pacman -S texlive-core \
	  texlive-fontsextra \
	  texlive-bibtexextra \
	  texstudio



# text editors and command line tools for text
#--------------------------------------------------
pacman -S neovim \
	  gvim \
	  pandoc \
	  pandoc-eqnos



# documents viewers
#--------------------------------------------------
pacman -S okular \
	  mupdf \
	  calibre



# image viewers and image manipulation
#--------------------------------------------------
pacman -S feh \
	  inkscape \
	  gimp \
	  pngquant \
	  jpegoptim \
	  imagemagick



# audio and video tools
#--------------------------------------------------
pacman -S audacity \
          kazam \
	  cheese \
	  ffmpeg



# finance
#--------------------------------------------------
pacman -S gnucash



# audio meta data
#--------------------------------------------------
pacman -s kid3



# fonts
#--------------------------------------------------
pacman -S ttf-ubuntu-font-family \
	  gnu-free-fonts \
	  noto-fonts \
	  ttf-dejavu



# dropbox and rclone
#--------------------------------------------------
pacman -S python-dropbox \
          rclone



# misc command line tools
#--------------------------------------------------
pacman -S xdotool \
	  gprename \
	  pdfgrep \
	  xclip \
	  source-highlight
