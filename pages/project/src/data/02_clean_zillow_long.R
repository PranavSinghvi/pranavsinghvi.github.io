library(dplyr)
library(tidyr)

raw <- readRDS("pages/project/data/zillow_zhvi_sfrcondo_metro_raw.Rds")

long <- raw |>
  pivot_longer(
    cols = matches("^[0-9]{4}-[0-9]{2}-[0-9]{2}$"),
    names_to = "date",
    values_to = "zhvi"
  ) |>
  mutate(date = as.Date(date)) |>
  rename(
    region_id = RegionID,
    size_rank = SizeRank,
    region_name = RegionName,
    region_type = RegionType,
    state_name = StateName
  ) |>
  filter(region_type == "msa", size_rank <= 100, date >= as.Date("2000-01-01")) |>
  group_by(region_id) |>
  filter(!any(is.na(zhvi))) |>
  ungroup() |>
  mutate(
    region = as.character(state.region[match(state_name, state.abb)]),
    region = ifelse(state_name == "DC", "South", region),
    price_band = cut(
      zhvi,
      breaks = c(0, 200000, 400000, 600000, Inf),
      labels = c("Under $200k", "$200k to $400k", "$400k to $600k", "Over $600k")
    )
  )

dir.create("pages/project/data/cleaned", showWarnings = FALSE, recursive = TRUE)
saveRDS(long, "pages/project/data/cleaned/zillow_zhvi_sfrcondo_metro_long.Rds")

glimpse(long)
