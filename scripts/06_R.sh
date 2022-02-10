# install R and some dependencies

echo installing R

# edit bash with:
export R_LIBS_USER='/home/blair/R'

# make directory for R packages
mkdir /home/blair/R

# base R
pacman -S r

# dependencies
#---------------------------------------------------
pacman -S tk tcl	    # windowing toolkit
pacman -S jdk-openjdk	    # java compiler
pacman -S gcc-fortran	    # gnu fortran compilder



# install packages
#Rscript r_packages.R

