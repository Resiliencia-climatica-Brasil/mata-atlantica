library(googledrive)
googledrive::drive_auth() #dar acessso desde o navegador
# Criando a pasta para não sobreescrever processed_data:
dir.create("drive_data/landform_variety", recursive = TRUE)

# Look up landform variety
lf_var <- drive_find(pattern = "landform_variety")

#Download from drive using the ids: 
for (i in seq_along(lf_var$id)) {
  id <- lf_var$id[i]
  googledrive::drive_download(file = as_id(id),
                              path = paste0("drive_data/landform_variety_", i),
                              overwrite = TRUE)
}


# Look up landform variety
## maybe with a function so we don't copy code
download_results <- function(pattern = "landform_variety") {
  lf_var <- drive_find(pattern = pattern)
  #Download from drive using the ids: 
  for (i in seq_along(lf_var$id)) {
    id <- lf_var$id[i]
    googledrive::drive_download(file = as_id(id),
                                path = paste0("drive_data/",pattern,"_", i),
                                overwrite = TRUE)
    }
}
download_results("Brazil_landform_types")

# NOTE: We have to ignore this folder to avoid UPLOADING back to GEE. It will kill our quota. 