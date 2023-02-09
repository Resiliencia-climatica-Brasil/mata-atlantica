
# IBGE solo link ---------------------------------------------------------------

link <- "https://geoftp.ibge.gov.br/informacoes_ambientais/pedologia/vetores/escala_250_mil/versao_2021/"

# Identifying folder and files --------------------------------------------

IBGE_folder <- readLines(url(link))

filtered_lines <- grep(".zip|.doc|.docx", IBGE_folder, value = TRUE)

files <- gsub("^.*href=\\\"|\\\">.*$", "", filtered_lines, perl = TRUE)

dir.create("./data/soil/IBGE", recursive = T)

# Downloading files -------------------------------------------------------

lapply(files, function(i) download.file(paste0(link, i), 
                                        destfile = paste0("./data/soil/IBGE/", i)))


# Extract zip files -------------------------------------------------------

zip_files <- dir("./data/soil/IBGE/", pattern = ".zip", full.names = TRUE)

lapply(zip_files, function(i) unzip(i, exdir = gsub(".zip$", "", i)))
