

#3)	Create a merged dataframe -- with the attributes from both dataframes

merged_data <- merge(us_arrest, us_census, by.x = "row.names", by.y = c("NAME"), all = TRUE)       # Merge data from us_census and us_arrest got as input from previous     
                                                                                                # modules using merge function on top of row.name and State Name.

