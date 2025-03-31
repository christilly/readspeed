#Required packages
library("plyr")
library("dplyr")

#Read in Goodreads data
GR_data <- read.csv("/Users/tillytran/Desktop/goodreads_library_export.csv", header = TRUE)

#Get rid of not readily useful data columns
GR_data <- GR_data %>% select(-c(Author.l.f, Additional.Authors, Binding, ISBN, ISBN13, Year.Published, Original.Publication.Year, Exclusive.Shelf, My.Review, Spoiler, Private.Notes, Owned.Copies, Bookshelves, Bookshelves.with.positions, Publisher))


#Convert empty Date.Read dates to NA and remove those books
GR_clean <- GR_data %>%
  mutate(Date.Read = na_if(Date.Read, "")) %>%  # Convert "" to NA
  filter(!is.na(Date.Read)) # Remove rows where Date.Read is NA
GR_clean

#Convert to date format
GR_clean$Date.Read <- as.Date(GR_clean$Date.Read, format="%Y/%m/%d")
GR_clean$Date.Added <- as.Date(GR_clean$Date.Added, format="%Y/%m/%d")

#Calculate number of days between date added and date read
GR_clean$days_diff <- as.numeric(GR_clean$Date.Read - GR_clean$Date.Added)


