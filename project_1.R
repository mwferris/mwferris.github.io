library(leaflet)
my_map <- leaflet() %>%
  addTiles()
my_map

#pipe in all bus stop locations
library(readr)
Bus_Stops <- read_delim("C:/Users/mferris/Desktop/Bus_Stops.csv", 
                        "\t", escape_double = FALSE, trim_ws = TRUE)

names(Bus_Stops)[names(Bus_Stops) == 'y'] <- 'Lat'
names(Bus_Stops)[names(Bus_Stops) == 'x'] <- 'Lng'


map <- Bus_Stops[,c(1:2)] %>%
  leaflet() %>%
  addTiles() %>%
  addMarkers(clusterOptions=markerClusterOptions(), popup = Bus_Stops$LOCATION)

map