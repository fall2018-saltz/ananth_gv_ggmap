
#Step B: Generate a color coded map

#3)	Create a color coded map, based on the area of the state 


library("ggplot2")                       #load library ggplot2
library("ggmap")                         #load library ggmap

states_map <- map_data("state")                                                           # load the entire usa map dataset using map_data - this contains infomration of each state against all possible latitude longitude points under it. 
options(scipen=999)                                                                       # Use options(scipen=999) to disable scientific notation and display the values in numeric format
map_by_area <- ggplot(merged_data, aes(map_id = merged_data$statename))                   # use ggplot function to declare varibles to be plotted the dataframe referenced and the data column to be used - here statename column
map_by_area <- map_by_area+ geom_map(map = states_map, aes(fill=merged_data$state.area))+ # append geom_map function to remember the polygons in the data framewith with attributes such as the map to be used for plotting and fill by Area of each state to color code the map
                 expand_limits(x = states_map$long, y=states_map$lat) + coord_map()+        # use expand limits function to Expand the plot limits and include single value to declare how the outline of map is to be plotted - by latitude and longitude.
                 labs(fill="Area") + labs(size="Murder Rate")                               # label the fill using labs function
map_by_area

