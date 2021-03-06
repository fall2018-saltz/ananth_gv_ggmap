
#Step C: Create a color shaded map of the U.S. based on the Murder rate for each state 

#4)	Repeat step B, but color code the map based on the murder rate of each state.

library("ggplot2")                       #load library ggplot2
library("ggmap")                         #load library ggmap

states_map <- map_data("state")                                                           # load the entire usa map dataset using map_data - this contains infomration of each state against all possible latitude longitude points under it. 
map_by_murder <- ggplot(merged_data, aes(map_id = merged_data$statename))                 # use ggplot function to declare varibles to be plotted the dataframe referenced and the data column to be used - here statename column
map_by_murder <- map_by_murder + geom_map(map = states_map,aes(fill=merged_data$Murder))+ # append geom_map function to remember the polygons in the data framewith with attributes such as the map to be used for plotting and fill by Murder rate to color code the map
                 expand_limits(x = states_map$long, y = states_map$lat)+                    # use expand limits function to Expand the plot limits and include single value to declare how the outline of map is to be plotted - by latitude and longitude.
                 labs(fill="Murder Rate")+ coord_map()                                      # use coord_map to project the plot into a 2D plane # label the fill using labs function





#5) Show the population as a circle per state (the larger the population, the larger the circle), using the location defined by the center of each state
  
  
states_map <- map_data("state")                                                                   # load the entire usa map dataset using map_data - this contains infomration of each state against all possible latitude longitude points under it. 
options(scipen=999)                                                                               # Use options(scipen=999) to disable scientific notation and display the values in numeric format
map_by_population <- ggplot(merged_data, aes(map_id = merged_data$statename))                     # use ggplot function to declare varibles to be plotted the dataframe referenced and the data column to be used - here statename column
map_by_population <- map_by_population+ geom_map(map = states_map, aes(fill=merged_data$Murder))+ # append geom_map function to remember the polygons in the data framewith with attributes such as the map to be used for plotting and fill by Murder Rate of each state to color code the map
                     expand_limits(x = states_map$long, y=states_map$lat) + coord_map()             # use expand limits function to Expand the plot limits and include single value to declare how the outline of map is to be plotted - by latitude and longitude.
map_by_population <- map_by_population+ geom_point(data = merged_data, mapping = aes(x=merged_data$x, merged_data$y, size = merged_data$POPESTIMATE2017))+ # append function geom_point to create a scatter plot between 2 continuous variables x, y and display size of point by magnitude of population assigned to size attribute
                     labs(fill="Murder Rate") + labs(size="Population")                             # label the fill  and size using labs function
