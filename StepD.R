
#Step D: Zoom the map

#6)	Repeat step C, but only show the states in the north east

library("ggplot2")                       #load library ggplot2
library("ggmap")                         #load library ggmap


states_map <- map_data("state")                                                            # load the entire usa map dataset using map_data - this contains infomration of each state against all possible latitude longitude points under it. 
options(scipen=999)                                                                        # Use options(scipen=999) to disable scientific notation and display the values in numeric format
latlon <- geocode("new york city, ny",source="dsk")                                        # use geocode function to geocode or mark a particular point by ltitude or longitude or name from data science tool kit(dsk) as source attribute for reference.
y1 <- latlon$lat-10                                                                        # Use the first intended latitude reference point y1 = geocodelatitude - 10
x1 <- latlon$lon-10                                                                        # Use the first intended longitude reference point x1 = geocodelongitude - 10
x2 <- latlon$lon+10                                                                        # Use the first intended latitude reference point y2 = geocodelatitude + 10
y2 <- latlon$lat+10                                                                        # Use the first intended longitude reference point x2 = geocodelongitude + 10
map_by_zoom <- ggplot(merged_data, aes(map_id = merged_data$statename))                    # use ggplot function to declare varibles to be plotted the dataframe referenced and the data column to be used - here statename column
map_by_zoom <- map_by_zoom+ geom_map(map = states_map, aes(fill=merged_data$state.area)) + # append geom_map function to remember the polygons in the data framewith with attributes such as the map to be used for plotting and fill by Murder Rate of each state to color code the map
                 xlim(c(x1,x2)) + ylim(c(y1,y2)) +                                           # xlim fucntion is used to filter all points not in this range. It will be usefl for zoom
                 expand_limits(x = states_map$long, y=states_map$lat) +                      # use expand limits function to Expand the plot limits and include single value to declare how the outline of map is to be plotted - by latitude and longitude.
                 coord_map()
map_by_zoom <- map_by_zoom+ 
                 geom_point(data = merged_data, mapping = aes(x=merged_data$x, merged_data$y, size = merged_data$POPESTIMATE2017))+ ## append function geom_point to create a scatter plot between 2 continuous variables x, y and display size of point by magnitude of population assigned to size attribute
                 labs(fill="Murder Rate") + labs(size="Population")                          # label the fill  and size using labs function
