
# IBGE link ---------------------------------------------------------------

link <- "https://geoftp.ibge.gov.br/informacoes_ambientais/geomorfologia/vetores/escala_250_mil/versao_2021/"


# Identifying folder and files to download -----------------------------------

IBGE_folder <- readLines(url(link))

filtered_lines <- grep(".zip|.doc|.docx", IBGE_folder, value = TRUE)

files <- gsub("^.*href=\\\"|\\\">.*$", "", filtered_lines, perl = TRUE)

dir.create("./data/geology/IBGE_geomorphology", recursive = T)

# Downloading files -------------------------------------------------------

lapply(files, function(i) download.file(paste0(link, i), 
                                             destfile = paste0("./data/geology/IBGE_geomorphology/", i)))


# Extracting files --------------------------------------------------------

zip_files <- dir("./data/geology/IBGE_geomorphology/", pattern = ".zip", full.names = TRUE)

lapply(zip_files, function(i) unzip(i, exdir = gsub(".zip$", "", i)))



