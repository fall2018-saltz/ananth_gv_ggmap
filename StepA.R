

#3)	Create a merged dataframe -- with the attributes from both dataframes

merged_data <- merge(us_arrest, us_census, by.x = "row.names", by.y = c("NAME"), all = TRUE)       # Merge data from us_census and us_arrest got as input from previous     
                                                                                                # modules using merge function on top of row.name and State Name.

merged_data <- merged_data[-c(9),]

rownames(merged_data) <- seq(length=nrow(merged_data)) 


center <- data.frame(state.center)
area <- data.frame(state.area)
name <- data.frame(state.name)

as.numeric(rownames(center))

merged_area <- cbind(name, area, center)

merged_data <- merge(merged_data ,merged_area, by.x = c("Row.names"), by.y = c("state.name"), all = TRUE)

colnames(merged_data)[1] <- "stateName"

library("ggplot2")
library("ggmap")
us <- map_data("state")
options(scipen=999)
map2 <- ggplot(merged_data, aes(map_id = stateName))
