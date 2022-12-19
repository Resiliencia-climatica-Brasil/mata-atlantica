
tiff("./graphics/landsform_Z.tif", width = 15, height = 15, units = "cm", res = 300)

plot(landform_Z)

dev.off()


tiff("./graphics/elevation_range__Z.tif", width = 15, height = 15, units = "cm", res = 300)

plot(elevation_range_Z)

dev.off()


tiff("./graphics/wetland_score.tif", width = 15, height = 15, units = "cm", res = 300)

plot(wetland_score)

dev.off()

tiff("./graphics/soil_diversity.tif", width = 15, height = 15, units = "cm", res = 300)

plot(soil_diversity)

dev.off()


tiff("./graphics/landscape_diversity.tif", width = 15, height = 15, units = "cm", res = 300)

plot(landscape_diversity)

dev.off()

