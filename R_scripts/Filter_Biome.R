# Importing Cerrado shapefile ---------------------------------------------
library(dplyr)
library(sf)
ecoregions <- sf::st_read("data/ecoregions/wwf/official/wwf_terr_ecos.shp")
bioma <- sf::st_read("data/bioma/Biomas/lm_bioma_250.shp")
index <- ecoregions %>% st_drop_geometry() %>% pull(ECO_NAME) %>% stringr::str_detect("Atlantic")
ecoregions[index,] %>% select(G200_REGIO, G200_NUM, G200_BIOME, G200_STAT, ECO_NAME) %>% distinct(ECO_NAME, .keep_all = TRUE)
#ecoregions meh, but maybe 
# ECO_NAME
# 1          Isthmian-Atlantic moist forests
# 2                   Atlantic mixed forests
# 3  Central American Atlantic moist forests
# 4              Southern Atlantic mangroves
# 5                 Atlantic Coast restingas
# 6             Alto Paraná Atlantic forests
# 7       North Atlantic moist mixed forests
# 8                     Atlantic dry forests
# 9            Atlantic coastal pine barrens
# 10         Middle Atlantic coastal forests
# 11                 Atlantic coastal desert
# 12     Atlantic Equatorial coastal forests
# Filtering Cerrado polygon and exporting ---------------------------------

baf_polygon <- bioma %>% filter(Bioma == "Mata Atlântica")
dir.create("processed_data/bioma")
sf::st_write(baf_polygon, "processed_data/bioma/baf.shp")
