require(flipTime)
directory = "~/Dropbox/Google Play Console Reports/reports/catrobat/pocketcode/crashes/"
filenames = list.files(directory, pattern = "^crashes_org\\.catrobat\\.catroid_.*overview.csv$")
full_filenames <- paste(directory, filenames, sep="")
head(directory)
head(filenames)
head(full_filenames)
crashes_and_anrs <- lapply(full_filenames, read.csv, fileEncoding="UTF-16", colClasses=c("Date"="Date"))
head(crashes_and_anrs)
crashes_and_anr_data <- do.call(rbind, crashes_and_anrs)
head(crashes_and_anr_data)
tail(crashes_and_anr_data)

