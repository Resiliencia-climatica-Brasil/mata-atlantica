# Importing Cerrado shapefile ---------------------------------------------

ecoregions <- sf::st_read("data/ecoregions/wwf/official/wwf_terr_ecos.shp")


# Filtering Cerrado polygon and exporting ---------------------------------

cerrado_polygon <- ecoregions[grep("Cerrado", ecoregions$ECO_NAME), ]

dir.create("processed_data/ecoregions", recursive = TRUE)

sf::st_write(cerrado_polygon, "processed_data/ecoregions/wwf_cerrado.shp")
