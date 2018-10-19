

#Step A - 	Load and Merge datasets

#2)	Add the area of each state, and the center of each state, to the merged dataframe, using the ‘state.center’, ‘state.center’ and ‘state.name’ vectors



merged_data <- merge(us_arrest, us_census, by.x = "row.names", by.y = c("NAME"), all = TRUE)    # merge 3 dataframes together using merge function by "row.names" from arrests and "NAME" (state name) of dfstates
                                                                                            # Union of data set is created by state name.

merged_data <- merged_data[-c(9),]       #remove the 9th row which is not a US state.

# rownames(merged_data) <- seq(length=nrow(merged_data)) 


center <- data.frame(state.center)       # fetch the centre dataset from state data source and convert to data frame using data.frame. This contains 2 columns
area <- data.frame(state.area)           # fetch the area dataset from state data source and convert to data frame using data.frame
name <- data.frame(state.name)           # fetch the name dataset from state data source and convert to data frame using data.frame

#as.numeric(rownames(center))

merged_area <- cbind(name, area, center) # merge all 3 dataframes name,area,centre. Since they are 50 Objects each they are cross merged by index

merged_data <- merge(merged_data ,merged_area, by.x = c("Row.names"), by.y = c("state.name"), all = TRUE)   # merge the crime merged data with the merged data frame of centre data by state name.

colnames(merged_data)[1] <- "statename"  # rename the state name in column 1 to statename

merged_data$statename = tolower(merged_data$statename)     # convert all state names to lower case for mapping it against ggmap USA map.
