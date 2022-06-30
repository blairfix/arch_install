library(data.table)

# sync R packages
print("syncing R packages")

# get software list
setwd("./software_lists")
sf_list = readLines('R')

# remove comments
id = grep("#", sf_list, fixed = T)
sf_list = sf_list[-id]

# remove blanks
sf_list = sf_list[sf_list != ""]

# sort in alpha order
sf_list = sort(sf_list)

# list installed packages
p = data.table( installed.packages() )

# keep uninstalled packages
sf_list = sf_list[! sf_list %in%  p$Package]

print(sf_list)

# install  new packages
if( length(sf_list) > 0){
    install.packages(sf_list)
}

