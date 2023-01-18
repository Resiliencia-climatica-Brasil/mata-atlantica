Climate resilience in Brazil
================
Andrea Sánchez-Tapia

- <a href="#workflow" id="toc-workflow">Workflow</a>
- <a href="#file-structure" id="toc-file-structure">File structure</a>

This is a preliminary structure for the climate resilience analyses
carried out by The Nature Conservancy Brazil and collaborators

- Adapted from code by Lucas Jardim

## Workflow

- Execute R_scripts that start with Download, then `Filter_Biome.R` (run
  for Cerrado and Caatinga)
- (Upload the data, How?!) Manually to `assets`
- Execute GEE scripts. Should create:
  - `elevation_range_residual.tif`
  - `landform_richness.tif`
  - `wetlands_density.tif`
  - `soil_diversity.tif`
- (Download the data? How?!) GEE saves to Gdrive.
- Execute [`Z_values.R`](R_scripts/Z_values.R). Should create Z value
  rasters in `./processed_data/z_values`
- Execute `landscape_diversity.R`. Takes Z rasters and creates
  `landscape_diversity.tif`.

## File structure

``` r
fs::dir_tree()
```

    ## .
    ## ├── GEE_scripts
    ## │   ├── 1_landforms
    ## │   ├── 2_elevation_range
    ## │   ├── 3_soil_diversity
    ## │   └── 4_wetland_score
    ## ├── README.Rmd
    ## ├── README.md
    ## ├── R_scripts
    ## │   ├── Download_Bioma_IBGE.R
    ## │   ├── Download_Carta_Geologica_IBGE.R
    ## │   ├── Downloading_IBGE_Solo.R
    ## │   ├── Downloading_ecoregions.R
    ## │   ├── Figures_landscape_diversity_maps.R
    ## │   ├── Filter_Biome.R
    ## │   ├── Z_values.R
    ## │   └── landscape_diversity.R
    ## ├── climate_resilience.Rproj
    ## ├── data
    ## │   ├── bioma
    ## │   │   ├── Biomas
    ## │   │   │   ├── lm_bioma_250.CPG
    ## │   │   │   ├── lm_bioma_250.dbf
    ## │   │   │   ├── lm_bioma_250.prj
    ## │   │   │   ├── lm_bioma_250.sbn
    ## │   │   │   ├── lm_bioma_250.sbx
    ## │   │   │   ├── lm_bioma_250.shp
    ## │   │   │   ├── lm_bioma_250.shp.xml
    ## │   │   │   └── lm_bioma_250.shx
    ## │   │   └── Biomas.zip
    ## │   ├── ecoregions
    ## │   │   ├── Ecoregions2017
    ## │   │   │   ├── Ecoregions2017.dbf
    ## │   │   │   ├── Ecoregions2017.prj
    ## │   │   │   ├── Ecoregions2017.shp
    ## │   │   │   └── Ecoregions2017.shx
    ## │   │   ├── Ecoregions2017.zip
    ## │   │   ├── wwf
    ## │   │   │   └── official
    ## │   │   │       ├── layerfiles_readme.txt
    ## │   │   │       ├── terr_biomes.lyr
    ## │   │   │       ├── wwf_terr_ecos.dbf
    ## │   │   │       ├── wwf_terr_ecos.htm
    ## │   │   │       ├── wwf_terr_ecos.lyr
    ## │   │   │       ├── wwf_terr_ecos.prj
    ## │   │   │       ├── wwf_terr_ecos.sbn
    ## │   │   │       ├── wwf_terr_ecos.sbx
    ## │   │   │       ├── wwf_terr_ecos.shp
    ## │   │   │       ├── wwf_terr_ecos.shp.xml
    ## │   │   │       └── wwf_terr_ecos.shx
    ## │   │   └── wwf_ecoregions.zip
    ## │   ├── geology
    ## │   │   └── IBGE_geomorphology
    ## │   │       ├── geom_area
    ## │   │       │   ├── geom_area.cpg
    ## │   │       │   ├── geom_area.dbf
    ## │   │       │   ├── geom_area.prj
    ## │   │       │   ├── geom_area.shp
    ## │   │       │   └── geom_area.shx
    ## │   │       ├── geom_area.zip
    ## │   │       ├── geom_atributos_2021.doc
    ## │   │       ├── geom_linha_simbolizada
    ## │   │       │   ├── geom_linha_simbolizada.cpg
    ## │   │       │   ├── geom_linha_simbolizada.dbf
    ## │   │       │   ├── geom_linha_simbolizada.prj
    ## │   │       │   ├── geom_linha_simbolizada.shp
    ## │   │       │   └── geom_linha_simbolizada.shx
    ## │   │       ├── geom_linha_simbolizada.zip
    ## │   │       ├── geom_ponto
    ## │   │       │   ├── geom_ponto.cpg
    ## │   │       │   ├── geom_ponto.dbf
    ## │   │       │   ├── geom_ponto.prj
    ## │   │       │   ├── geom_ponto.shp
    ## │   │       │   └── geom_ponto.shx
    ## │   │       ├── geom_ponto.zip
    ## │   │       ├── geom_ponto_simbolizado
    ## │   │       │   ├── geom_ponto_simbolizado.cpg
    ## │   │       │   ├── geom_ponto_simbolizado.dbf
    ## │   │       │   ├── geom_ponto_simbolizado.prj
    ## │   │       │   ├── geom_ponto_simbolizado.shp
    ## │   │       │   └── geom_ponto_simbolizado.shx
    ## │   │       ├── geom_ponto_simbolizado.zip
    ## │   │       └── leia_me.docx
    ## │   └── soil
    ## │       └── IBGE
    ## │           ├── leia_me.docx
    ## │           ├── pedo_area
    ## │           │   ├── pedo_area.cpg
    ## │           │   ├── pedo_area.dbf
    ## │           │   ├── pedo_area.prj
    ## │           │   ├── pedo_area.shp
    ## │           │   └── pedo_area.shx
    ## │           ├── pedo_area.zip
    ## │           ├── pedo_atributos_2021.doc
    ## │           ├── pedo_ponto
    ## │           │   ├── pedo_ponto.cpg
    ## │           │   ├── pedo_ponto.dbf
    ## │           │   ├── pedo_ponto.prj
    ## │           │   ├── pedo_ponto.shp
    ## │           │   └── pedo_ponto.shx
    ## │           └── pedo_ponto.zip
    ## ├── processed_data
    ## │   ├── bioma
    ## │   │   ├── baf.dbf
    ## │   │   ├── baf.prj
    ## │   │   ├── baf.shp
    ## │   │   └── baf.shx
    ## │   ├── ecoregions
    ## │   │   ├── wwf_cerrado.dbf
    ## │   │   ├── wwf_cerrado.prj
    ## │   │   ├── wwf_cerrado.shp
    ## │   │   └── wwf_cerrado.shx
    ## │   ├── landform_richness.tif
    ## │   ├── landform_types_Brazil.tif
    ## │   └── landform_variety_Brazil.tif
    ## └── rgee.R
