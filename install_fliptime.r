# Installs the development tools and then builds flipTime from source.
# 
# Intended to help parse dates correctly in the files from Google Play Console.

install.packages("devtools")
require(devtools)
install_github("Displayr/flipTime")
library("flipTime")
