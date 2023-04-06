library(tidyr)
library(ggplot2)
library(readr)
data <- read_csv("results/extract_data3.csv")
data2 <- read_csv("results/extract_data4.csv")
dim(data2)
identical(data, data2)
data %>% count(moisture_classes)
data2 %>% count(moisture_classes)
data %>% count(water)
data2 %>% count(water)
names(data)

#legenda
legenda <- c(
"3-Cool Steep Slope",
"4-Warm Steep Slope",
"5-Cliff",
"11-Summit/Ridgetop",
"13-Slope Crest",
"21-Flat Hilltop",
"22-Gentle Slope Hilltop",
"23-Cool Sideslope",
"24-Warm Sideslope",
"30-Dry Flats",
"32-Valley/Toeslope",
"39-Moist Flats",
"43-Cool Footslope/Cove",
"44-Warm Footslope/Cove"
)

leg <- stringr::str_split(legenda, "-", simplify = T) %>% data.frame()
names(leg) <- c("landform_types", "category")
leg$landform_types <- as.numeric(leg$landform_types)
data %>%
  select(-.geo) %>% #no geometries
  left_join(leg) %>%
  pivot_longer(cols = -c(`system:index`, "category"),
               values_to = "value",
               names_to = "variable") %>%
  filter(variable != "landform_variety") %>%
  filter(variable != "landform_types") %>%
  ggplot(aes(x = category, y = value)) +
  geom_boxplot() +
  geom_point(size = 0.3) +
  facet_wrap(~variable, scales = "free_y") +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))
head(data)
