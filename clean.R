
#1)	Read in the census dataset (using the function created in HW 3)


clean_data <- function(data) {           # function defination
  
  length_data <- nrow(data)               # get length of the dataframe using nrow                                                                                                                #Compute length using nrow to get index of last row.
  data <- data[-length_data, ]
  data <- data[-1, ]                                   # Remove first row which has USA
  nrow(data)                             # Displays the length of modified data frame = 51
  
  
  #	Make sure there are precisely 4 columns, with the following names - stateName, population, popOver18, percentOver18. 
  colnames(data)                         # use colnames to display column name metadata
  data$SUMLEV <- NULL                    # set other column name to NULL to be omitted
  data$REGION <- NULL                    # set other column name to NULL to be omitted
  data$STATE <- NULL                      # set other column name to NULL to be omitted
  colnames(data)
  
  return(data)                           # return clean data frame.
}

resultant_dataframe <- clean_data(data)  # call the function with data as paramenter got from the previous linked rscript output.

resultant_dataframe                      # resultant_dataframe is input to next module
  
