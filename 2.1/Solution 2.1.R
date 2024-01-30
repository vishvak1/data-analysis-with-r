# Reading the data

election_data <- read.csv("./csv/data.csv", stringsAsFactors = FALSE)

parties <- election_data$Party
results_2014 <- election_data$Results_2014
results_2009 <- election_data$Results_2009  # Make sure the column name matches exactly

# Replace any "-" with NA for results where a party did not participate in an election
results_2014 <- as.numeric(gsub("-", NA, results_2014))
results_2009 <- as.numeric(gsub("-", NA, results_2009))

# Short form of party names

short_parties <- sub(" \\(.*", "", parties)

# (a) Create the 2014 bar chart
par(mar=c(5, 4, 4, 2) + 0.1) 
bp <- barplot(results_2014, names.arg=short_parties, las=2, col="blue",
              main="2014 South African National Election Results",
              xlab="Party", ylab="Percentage of Votes", ylim=c(0, 70))

# (b) Create the comparison bar chart
results_matrix <- rbind(results_2009, results_2014)
bp2 <- barplot(results_matrix, names.arg = short_parties, beside=TRUE, col=c("red", "blue"), las=2,
               main="Comparison of 2009 and 2014 South African National Election Results",
               xlab="Party", ylab="Percentage of Votes", ylim=c(0, 70))

# Add a legend
legend("topright", legend=c("2009", "2014"), fill=c("red", "blue"))
