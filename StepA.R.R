


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


library(ggplot2)
library(ggmap)


mapImageData2 <- get_map(location = c(lon = -0.016179, lat = 51.538525),
    color = "color",
    source = "google",
    maptype = "terrain",
    zoom = 16)
    
abc <- ggmap(mapImageData2,
    extent = "device",
    ylab = "Latitude",
    xlab = "Longitude")


