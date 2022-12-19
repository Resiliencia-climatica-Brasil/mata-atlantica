library(terra)


# Importing data ----------------------------------------------------------

bioma <- vect("./processed_data/Biomas/Caatinga.shp")

landform_Z <- terra::rast("./processed_data/z_values/landform_Z.tif")

elevation_range_Z <- terra::rast("./processed_data/z_values/elevation_range_Z.tif")

wetland_score <- terra::rast("./processed_data/z_values/wetland_score.tif")

soil_diversity <- terra::rast("./processed_data/z_values/soil_diversity_Z.tif")


# Step 1 ------------------------------------------------------------------
# Take the average of landform and elevation range only if elevantion range is higher than landform

landscape_diversity <- landform_Z

test_1 <- elevation_range_Z > landscape_diversity 

average_elevation <- ((2 * landform_Z) + elevation_range_Z) / 3

landscape_diversity[test_1] <- average_elevation[test_1]


# Step 2 ------------------------------------------------------------------
#Take the average of landform, elevation range and wetland score only if wetland score is higher than Step 1

test_2 <- wetland_score > landscape_diversity


# Calculate average -------------------------------------------------------
# Elevation range higher than landform ------------------------------------

average_wetland_1 <- ((2 * landform_Z) + elevation_range_Z + wetland_score) / 4

average_wetland_2 <- ((2 * landform_Z) + wetland_score) / 3


# Assigning new landform diversity values ---------------------------------

landscape_diversity[test_1 & test_2] <- average_wetland_1[test_1 & test_2]

landscape_diversity[!test_1 & test_2] <- average_wetland_1[!test_1 & test_2]

# Step 3 ------------------------------------------------------------------
# Take the average  of soil diversity only if it is higher than Step 2

test_3 <- soil_diversity > landscape_diversity


# Averages ----------------------------------------------------------------

average_soil_1 <-  ((2 * landform_Z) + elevation_range_Z + wetland_score + soil_diversity) / 5

average_soil_2 <-  ((2 * landform_Z) + elevation_range_Z + soil_diversity) / 4

average_soil_3 <-  ((2 * landform_Z) + wetland_score + soil_diversity) / 4

average_soil_4 <-  ((2 * landform_Z) + soil_diversity) / 3


# Assigning new landscape diversity values  -------------------------------

landscape_diversity[test_1 & test_2 & test_3] <- average_soil_1[test_1 & test_2 & test_3]

landscape_diversity[test_1 & !test_2 & test_3] <- average_soil_2[test_1 & !test_2 & test_3]

landscape_diversity[!test_1 & test_2 & test_3] <- average_soil_3[!test_1 & test_2 & test_3]

landscape_diversity[!test_1 & !test_2 & test_3] <- average_soil_4[!test_1 & !test_2 & test_3]






