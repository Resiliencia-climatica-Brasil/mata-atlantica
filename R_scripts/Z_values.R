library(terra)

bioma <- vect("./processed_data/Biomas/Caatinga.shp")

# Elevation range ---------------------------------------------------------

#elevation_range <- log(do.call(terra::merge, 
#                           lapply(dir("./processed_data/elevation_range/", pattern = "elevation_range", full.names = TRUE), 
#                                  terra::rast)) + 0.01)


# Transform elevation range and calculate Z-scores -------------------------

elevation_range <- log(terra::rast("./processed_data/elevation_range/elevation_range_residual.tif") + 0.01)

elevation_range_Z <- (elevation_range - global(elevation_range, mean, na.rm = TRUE)[, 1]) / global(elevation_range, sd, na.rm = TRUE)[, 1]


# Landform variety --------------------------------------------------------

# Transform landform variety and calculate Z-scores -----------------------

landform  <- log(terra::rast("./processed_data/landform_diversity/landform_richness.tif") + 1)

landform_Z <- (landform - global(landform, mean, na.rm = TRUE)[, 1]) / global(landform, sd, na.rm = TRUE)[, 1]


# Wetland score -----------------------------------------------------------
# # Transform Wetland Density 100 acre and calculate Z-scores -------------------------

#wetland_density_100 <- do.call(terra::merge, lapply(dir("./processed_data/wetland/", pattern = "wetlands_density", full.names = TRUE), terra::rast))

wetland_density_100 <- terra::rast("./processed_data/wetland/wetlands_density.tif")

# Reproject wetland raster to landform projection -------------------------
# Wetland raster were exported in a different projection than landforms
# and elevation range

wetland_density_100 <- terra::project(wetland_density_100, landform_Z)

# Also, GEE created null values for 0 density values, we assigned 0 to the values before 
# calculating Z-scores

wetland_density_100[is.na(wetland_density_100)] <- 0

wetland_density_100 <- terra::mask(wetland_density_100, bioma)

wetland_density_100_Z <- (wetland_density_100 - global(wetland_density_100, mean, na.rm = TRUE)[, 1]) / global(wetland_density_100, sd, na.rm = TRUE)[, 1]

# Wetland Density 1000 acre -----------------------------------------------

#wetland_density_1000 <- do.call(terra::merge, lapply(dir("./processed_data/wetland/", pattern = "wetlands_density_1000", full.names = TRUE), terra::rast))

wetland_density_1000 <- terra::rast("./processed_data/wetland/wetlands_density_1000.tif")

wetland_density_1000 <- terra::project(wetland_density_1000, landform_Z)

wetland_density_1000[is.na(wetland_density_1000)] <- 0

wetland_density_1000 <- terra::mask(wetland_density_1000, bioma)

wetland_density_1000_Z <- (wetland_density_1000 - global(wetland_density_1000, mean, na.rm = TRUE)[, 1]) / global(wetland_density_1000, sd, na.rm = TRUE)[, 1]

# Wetland density ---------------------------------------------------------
# Calculating wetland density as the average of two wetland density window 100 and 1000 acres 

wetland_density <- ((2 * wetland_density_100_Z) + wetland_density_1000_Z) / 3

# Wetland Patchness
#Wetland patchness is the number of wetlands within a a circle of 1000 acres
#wetland_patchness <- do.call(terra::merge, lapply(dir("./processed_data/wetland/", pattern = "wetlands_patchness", full.names = TRUE), terra::rast))
wetland_patchness <- terra::rast("./processed_data/wetland/wetlands_patchness.tif")

wetland_patchness <- terra::project(wetland_patchness, landform_Z)

wetland_patchness[is.na(wetland_patchness)] <- 0

wetland_patchness <- terra::mask(wetland_patchness, bioma)

wetland_patchness_Z <- (wetland_patchness - global(wetland_patchness, mean, na.rm = TRUE)[, 1]) / global(wetland_patchness, sd, na.rm = TRUE)[, 1]

# Wetland score -----------------------------------------------------
# Wetland score is the average of wetland density and wetland patchness, but only when patchness is higher than density

wetland_score <- terra::ifel(wetland_patchness_Z > wetland_density, ((wetland_density * 3) + wetland_patchness_Z) / 4, wetland_density, 
                             filename = "./processed_data/wetland/wetland_score.tif",
                             overwrite = TRUE)

# Soil diversity ----------------------------------------------------------

soil_diversity <- terra::rast("./processed_data/soil/soil_diversity.tif")

soil_diversity <- terra::project(soil_diversity, landform_Z)

soil_diversity_Z <- (soil_diversity - global(soil_diversity, mean, na.rm = TRUE)[, 1]) / global(soil_diversity, sd, na.rm = TRUE)[, 1]


# Export Z rasters --------------------------------------------------------

dir.create("./processed_data/z_values")

terra::writeRaster(landform_Z, "./processed_data/z_values/landform_Z.tif")

terra::writeRaster(elevation_range_Z, "./processed_data/z_values/elevation_range_Z.tif")

terra::writeRaster(wetland_score, "./processed_data/z_values/wetland_score.tif")

terra::writeRaster(soil_diversity_Z, "./processed_data/z_values/soil_diversity_Z.tif")








