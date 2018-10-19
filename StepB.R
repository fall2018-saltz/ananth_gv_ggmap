
library("ggplot2")                       #load library ggplot2
library("ggmap")                         #load library ggmap

states_map <- map_data("state")                                                           # load the entire usa map dataset using map_data - this contains infomration of each state against all possible latitude longitude points under it. 
map_by_murder <- ggplot(merged_data, aes(map_id = merged_data$statename))                 # use ggplot function to declare varibles to be plotted the dataframe referenced and the data column to be used - here statename column
map_by_murder <- map_by_murder + geom_map(map = states_map,aes(fill=merged_data$Murder))+ # append geom_map function to remember the polygons in the data framewith with attributes such as the map to be used for plotting and fill by Murder rate to color code the map
                 expand_limits(x = states_map$long, y = states_map$lat)+                    # use expand limits function to Expand the plot limits and include single value to declare how the outline of map is to be plotted - by latitude and longitude.
                 labs(fill="Murder Rate")+ coord_map()  
                 
map_by_murder
