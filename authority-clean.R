## Construct a large flat file for the following Author-ity fields:
# 4. Author-ity ID (AID) of author
# 5. number of author instances
# 12. range of years
# 15. names of journals (count)
# 18. AIDs of co-authors (count)
# 19. PMIDs of author instances
# 20. grant IDs
# 21. total citations
# 23. PMIDs by the author that have been cited (count)
# 24. PMIDs that the author cited (count)
# 25. PMIDs that cited the author (count)

# load package
require(authority_reader)

# authority file names
authority.files <- sprintf('authority2009.part%02d', 0:17)

# which fields to include
wh.col <- c(4:5, 12, 15, 18:21, 23:25)

# how many lines to read at a time
no.lines <- 9

# initialize empty file
file.name <- 'authority.csv'
if(!file.exists(file.name)) {
    file.create(file.name)
}

# for each authority file, in batches of no.lines:
for(file in authority.files) {
    n <- 0
    N <- countLines(file)
    while(N > n) {
        
    }
}