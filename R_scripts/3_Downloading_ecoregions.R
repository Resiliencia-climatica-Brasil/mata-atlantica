dir.create("data/ecoregions")

timeout <- options("timeout")

options(timeout = 500)


# Downloading WWF ecoregions ----------------------------------------------

download.file(url = "https://files.worldwildlife.org/wwfcmsprod/files/Publication/file/6kcchn7e3u_official_teow.zip?_ga=2.208199764.790602033.1659119512-1316609852.1657199709",
              destfile = "data/ecoregions/wwf_ecoregions.zip")


unzip(zipfile = "data/ecoregions/wwf_ecoregions.zip", 
      exdir = "data/ecoregions/wwf")

file.remove("data/ecoregions/wwf_ecoregions.zip")


# Downloading Dinerstein (et al 2017) ecoregions --------------------------

download.file("https://storage.googleapis.com/teow2016/Ecoregions2017.zip",
              destfile = "data/ecoregions/Ecoregions2017.zip")

unzip(zipfile = "data/ecoregions/Ecoregions2017.zip", 
      exdir = "data/ecoregions/Ecoregions2017")

file.remove("data/ecoregions/Ecoregions2017.zip")

options(timeout = timeout[[1]])
