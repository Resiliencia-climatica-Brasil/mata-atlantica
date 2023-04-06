# Creates a mosaic from the data saved from GDrive and saves them to /processed_data
# Processed_data also needs to be ignored by git!
library(terra)
library(tictoc)

# landform types -----
files <- list.files("drive_data", full.names = T, pattern = "landform_types")
all_stack <- purrr::map(files, terra::rast)

tic()
Landform_types <- mosaic(
  all_stack[[1]],
  all_stack[[2]],
  all_stack[[3]],
  all_stack[[4]],
  all_stack[[5]],
  all_stack[[6]],
  all_stack[[7]],
  all_stack[[8]],
  all_stack[[9]]
)
toc()

terra::writeRaster(Landform_types,
                   filename = "processed_data/landform_types.tif",
                   overwrite = TRUE)

# landform variety-----
files <- list.files("drive_data", full.names = T, pattern = "landform_variety")
all_stack <- purrr::map(files, terra::rast)

Landform_var <- mosaic(
  all_stack[[1]],
  all_stack[[2]],
  all_stack[[3]],
  all_stack[[4]]
)

terra::writeRaster(Landform_var,
                   filename = "processed_data/landform_variety.tif",
                   overwrite = TRUE)

# elevation range residual-----
files <- list.files("drive_data", full.names = T, pattern = "elevation_range_residual")
all_stack <- purrr::map(files, terra::rast)
tic()
elev <- mosaic(
  all_stack[[1]],
  all_stack[[2]],
  all_stack[[3]],
  all_stack[[4]],
  all_stack[[5]],
  all_stack[[6]],
  all_stack[[7]],
  all_stack[[8]],
  all_stack[[9]]
)
toc()
terra::writeRaster(elev,
                   filename = "processed_data/elevation_range.tif",
                   overwrite = TRUE)


# soil diversity-----
files <- list.files("drive_data", full.names = T, pattern = "soil_diversity")
all_stack <- purrr::map(files, terra::rast)
tic()
soil_div <- mosaic(
  all_stack[[1]],
  all_stack[[2]],
  all_stack[[3]],
  all_stack[[4]],
  all_stack[[5]],
  all_stack[[6]],
  all_stack[[7]],
  all_stack[[8]],
  all_stack[[9]]
)
toc()
terra::writeRaster(soil_div,
                   filename = "processed_data/soil_diversity.tif",
                   overwrite = TRUE)

# wetlands------
files <- list.files("drive_data", full.names = T, pattern = "wetlands_density-")
all_stack <- purrr::map(files, terra::rast)
tic()
wet_div <- mosaic(
  all_stack[[1]],
  all_stack[[2]],
  all_stack[[3]],
  all_stack[[4]],
  all_stack[[5]],
  all_stack[[6]],
  all_stack[[7]],
  all_stack[[8]],
  all_stack[[9]]
)
toc()
terra::writeRaster(wet_div,
                   filename = "processed_data/wetlands_density.tif",
                   overwrite = TRUE)


# wetlands 1000------
files <- list.files("drive_data", full.names = T, pattern = "wetlands_density_1000")
all_stack <- purrr::map(files, terra::rast)
tic()
wet_div_1000 <- mosaic(
  all_stack[[1]],
  all_stack[[2]],
  all_stack[[3]],
  all_stack[[4]],
  all_stack[[5]],
  all_stack[[6]],
  all_stack[[7]],
  all_stack[[8]],
  all_stack[[9]]
)
toc()
terra::writeRaster(wet_div_1000,
                   filename = "processed_data/wetlands_density_1000.tif",
                   overwrite = TRUE)



# ENVIRONMENTAL DATA FOR VALIDATION----
## DEM------
files <- list.files("drive_data", full.names = T, pattern = "DEM")
all_stack <- purrr::map(files, terra::rast)
tic()
DEM <- terra::mosaic(
  all_stack[[1]],
  all_stack[[2]],
  all_stack[[3]],
  all_stack[[4]]
)
toc()
terra::writeRaster(DEM,
                   filename = "processed_data/DEM.tif",
                   overwrite = TRUE)

## Slope------
files <- list.files("drive_data", full.names = T, pattern = "slope")
all_stack <- purrr::map(files, terra::rast)
tic()
slope <- terra::mosaic(
  all_stack[[1]],
  all_stack[[2]],
  all_stack[[3]],
  all_stack[[4]]
)
toc()
tic()
terra::writeRaster(slope,
                   filename = "processed_data/slope.tif",
                   overwrite = TRUE)
toc()
## Aspect------
files <- list.files("drive_data", full.names = T, pattern = "aspect")
all_stack <- purrr::map(files, terra::rast)
tic()
aspect <- terra::mosaic(
  all_stack[[1]],
  all_stack[[2]],
  all_stack[[3]],
  all_stack[[4]]
)
toc()
terra::writeRaster(aspect,
                   filename = "processed_data/aspect.tif",
                   overwrite = TRUE)

## flow acc------
files <- list.files("drive_data", full.names = T, pattern = "flow_acc")
all_stack <- purrr::map(files, terra::rast)
tic()
flow_acc <- terra::mosaic(
  all_stack[[1]],
  all_stack[[2]],
  all_stack[[3]],
  all_stack[[4]]
)
toc()
terra::writeRaster(flow_acc,
                   filename = "processed_data/flow_acc.tif",
                   overwrite = TRUE)
## TPI------
files <- list.files("drive_data", full.names = T, pattern = "TPI")
all_stack <- purrr::map(files, terra::rast)
tic()
tpi <- terra::mosaic(
  all_stack[[1]],
  all_stack[[2]],
  all_stack[[3]],
  all_stack[[4]]
)
toc()
terra::writeRaster(tpi,
                   filename = "processed_data/TPI.tif",
                   overwrite = TRUE)
