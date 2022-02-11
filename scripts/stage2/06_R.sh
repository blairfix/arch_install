# install R and some dependencies

echo installing R

# make directory for R packages
mkdir /home/blair/R

# base r and some dependencies
sudo pacman -S r \
	       tk \
	       tcl \
	       jdk-openjdk \
	       gcc-fortran


# radian console
yay -S radian

# install packages
Rscript r_packages.R


