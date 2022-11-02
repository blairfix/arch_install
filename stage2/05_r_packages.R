# install R packages

print("installing R packages")

setwd("./software_lists")

# get software list
sf_list = readLines('R')

# remove comments
id = grep("#", sf_list, fixed = T)
sf_list = sf_list[-id]

# remove blanks
sf_list = sf_list[sf_list != ""]


# install 
install.packages(sf_list)

