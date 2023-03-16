# Download data created by GEE to Drive----

library(googledrive)
googledrive::drive_auth() #dar acessso desde o navegador
2
## Criando a pasta para não sobreescrever processed_data:----
#dir.create("drive_data")#run only once


## Look up landform variety and download by id----
## with a function so we don't copy code
download_results <- function(pattern = "landform_variety", dest_folder = "drive_data") {
  lf_var <- drive_find(pattern = pattern)
  #Download from drive using the ids: 
  for (i in seq_along(lf_var$id)) {
    id <- lf_var$id[i]
    googledrive::drive_download(file = as_id(id),
                                path = paste0(dest_folder, "/", pattern, "_", i),
                                overwrite = TRUE)
    }
}
#esta primera tanda de downloads fue sin el clip dont repeat!
#download_results("landform_variety")# default
#download_results("Brazil_landform_types")
#download_results("elevation_range_residual")
#download_results("soil_diversity")
# drive_find("wetlands")
# download_results("wetlands_density-")#o tracinho é para diferenciar de _1000
# download_results("wetlands_density_1000")

# NOTE: We have to ignore this folder to avoid UPLOADING back to GEE. It will kill our quota. 

# environmental rasters for validation
# drive_find("Brazil_")
# download_results("slope")
# download_results("Brazil_moisture_index")
# download_results("Brazil_flow_acc")
# download_results("Brazil_aspect")
# download_results("Brazil_TPI")
# download_results("Brazil_DEM")

#tabela
table <- drive_find("extract_data.csv")
table
data <- drive_download(table, path = "results/extract_data.csv", overwrite = TRUE)
#i am saving elsewhere because i want to be able to version this

# new download, everything w clip
clip_files <- drive_find("_clip")
download_clipped <- function(pattern = "landform_variety", dest_folder = "drive_data") {
  #lf_var <- drive_find(pattern = pattern)
  lf_var <- clip_files[stringr::str_detect(string = clip_files$name, pattern = pattern),]
  #Download from drive using the ids: 
  for (i in seq_along(lf_var$id)) {
    id <- lf_var$id[i]
    googledrive::drive_download(file = as_id(id),
                                path = paste0(dest_folder, "/", pattern, "_", i),
                                overwrite = TRUE)
  }
}
download_clipped("landform_variety", dest_folder = "clipped_data")
download_clipped("aspect", dest_folder = "clipped_data")
download_clipped("DEM", dest_folder = "clipped_data")
download_clipped("elevation_range_residual", dest_folder = "clipped_data")
download_clipped("flow_acc", dest_folder = "clipped_data")
download_clipped("landform_types", dest_folder = "clipped_data")
download_clipped("moisture_classes", dest_folder = "clipped_data")
download_clipped("moisture_index", dest_folder = "clipped_data")
download_clipped("slope", dest_folder = "clipped_data")
download_clipped("soil", dest_folder = "clipped_data")
download_clipped("TPI", dest_folder = "clipped_data")
download_clipped("water", dest_folder = "clipped_data")
download_clipped("wetlands_density_1000_", dest_folder = "clipped_data")
download_clipped("wetlands_density_clip", dest_folder = "clipped_data")
