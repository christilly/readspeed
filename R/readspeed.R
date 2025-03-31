#Required packages
library("plyr")
library("dplyr")

#Read in Goodreads data
GR_data <- read.csv("/Users/tillytran/Desktop/goodreads_library_export.csv", header = TRUE)

#Get rid of not readily useful data columns
GR_data <- GR_data %>% select(-c(Author.l.f, Additional.Authors, Binding, ISBN, ISBN13, Year.Published, Original.Publication.Year, Exclusive.Shelf, My.Review, Spoiler, Private.Notes, Owned.Copies, Bookshelves, Bookshelves.with.positions))

GR_data
