# u = "http://geoportal1-ons.opendata.arcgis.com/datasets/f99b145881724e15a04a8a113544dfc5_0.geojson?outSR={%22latestWkid%22:27700,%22wkid%22:27700}"
u = "https://github.com/ONSvisual/topojson_boundaries/raw/master/geogGBregion.json"
gors = sf::read_sf(u)
gors$AREANM
gors_eng = gors[1:9, ]
gors$AREANM
gors_eng$mega_region = c(
  "North",
  "North",
  "North",
  "East",
  "West",
  "East",
  "London",
  "East",
  "West"
)
library(tidyverse)

mega_regions = gors_eng %>% 
  group_by(mega_region) %>% 
  summarise(n = n())
plot(mega_regions)
sf::write_sf(mega_regions, "mega_regions.geojson")
sf::st_crs(mega_regions) = "EPSG:4326"
sf::write_sf(mega_regions, "mega_regions_shape.shp")
f = list.files(pattern = "shape")
f
zip(zipfile = "mega_regions.zip", files = f)
system("gh release upload 1 mega_regions.zip")
# piggyback::pb_upload("mega_regions.zip")
# piggyback::pb_new_release()


