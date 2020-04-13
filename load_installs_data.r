# Process installs for Pocket Code Android app

# Functions from
# https://amywhiteheadresearch.wordpress.com/2013/05/13/combining-dataframes-when-the-columns-dont-match/

require(flipTime)

rbind.match.columns <- function(input1, input2) {
    n.input1 <- ncol(input1)
    n.input2 <- ncol(input2)
 
    if (n.input2 < n.input1) {
        TF.names <- which(names(input2) %in% names(input1))
        column.names <- names(input2[, TF.names])
    } else {
        TF.names <- which(names(input1) %in% names(input2))
        column.names <- names(input1[, TF.names])
    }
 
    return(rbind(input1[, column.names], input2[, column.names]))
}
 
rbind.all.columns <- function(x, y) {
 
    x.diff <- setdiff(colnames(x), colnames(y))
    y.diff <- setdiff(colnames(y), colnames(x))
 
    x[, c(as.character(y.diff))] <- NA
 
    y[, c(as.character(x.diff))] <- NA
 
    return(rbind(x, y))
}

install_directory = "~/Dropbox/Google Play Console Reports/reports/catrobat/pocketcode/installs/"
install_filenames = list.files(install_directory, pattern = "^installs_org\\.catrobat\\.catroid_.*overview.csv$")
full_install_filenames <- paste(install_directory, install_filenames, sep="")
installs <- lapply(full_install_filenames, read.csv, fileEncoding="UTF-16")

# We need to decide whether to use all the data, or only what's common.
# Google doesn't complete some columns even though they are provided
# So using all columns is necessary to do meaningful analysis.
installs.data <- Reduce(rbind.all.columns, installs)
# installs.data <- Reduce(rbind.match.columns, installs)
