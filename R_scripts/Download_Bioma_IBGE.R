# Create bioma folder -----------------------------------------------------

dir.create("./data/bioma")


# Download bioma zip file -------------------------------------------------

download.file(url = "http://geoftp.ibge.gov.br/informacoes_ambientais/estudos_ambientais/biomas/vetores/Biomas_250mil.zip",
              destfile = "./data/bioma/Biomas.zip")


# Extract files -----------------------------------------------------------

unzip(zipfile = "./data/bioma/Biomas.zip",
      exdir = "./data/bioma/Biomas")
      
