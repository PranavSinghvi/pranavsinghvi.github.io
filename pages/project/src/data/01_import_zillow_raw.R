library(readr)


raw <- read_csv(file.choose())

dir.create("pages/project/data", showWarnings = FALSE, recursive = TRUE)
saveRDS(raw, "pages/project/data/zillow_zhvi_sfrcondo_metro_raw.Rds")
