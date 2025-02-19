# Loading libraries
library(leaflet)
library(htmlwidgets)

# Creating Leaflet map
map <- CAData_2023_ %>%
  leaflet() %>%
  addTiles() %>%
  addCircleMarkers(
    lat = ~Latitude,
    lng = ~Longitude,
    label = ~paste("Label:", Name, ", Phone Number:", Telephone)
  )

# Add layers control for filter
map <- map %>%
  addLayersControl(
    overlayGroups = c("Hotels", "B&Bs"),
    options = layersControlOptions(collapsed = FALSE)
  )

# Define layer groups for Hotels and B&Bs
hotel_group <- subset(CAData_2023_, Category == "Hotel")
bnb_group <- subset(CAData_2023_, Category == "B&B")

# Add hotel markers to the map (set color to red) with popups on hover
map <- map %>% addCircleMarkers(
  data = hotel_group,
  lat = ~Latitude,
  lng = ~Longitude,
  color = "red",
  group = "Hotels",
  popup = ~paste("<b>", Name, "</b><br>Phone Number: ", Telephone, "<br><a href='", Url, "' target='_blank'>Visit ", Url, "</a>")
)

# Add B&B markers to the map (set color to yellow) with popups on hover
map <- map %>% addCircleMarkers(
  data = bnb_group,
  lat = ~Latitude,
  lng = ~Longitude,
  color = "yellow",
  group = "B&Bs",
  popup = ~paste("<b>", Name, "</b><br>Phone Number: ", Telephone, "<br><a href='", Url, "' target='_blank'>Visit ", Url, "</a>")
)

saveWidget(map, file = "Accomodation-map.html")
