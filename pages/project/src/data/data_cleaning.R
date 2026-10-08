################################################################################
# Script Name: data_cleaning.R
# Author: <your name>
# GitHub: <your-gh-username>
# Date Created:
#
# Purpose: This script <description of what the script does>
#
#
#                       IMPORTANT
# Do not overwrite any data files. Raw files should always remain raw and
# untouched and ideally physically separate from the raw file in order to 
# reduce confusion.
# 
# If you need to clean your data, edit data_cleaning.R that you see inside
# pages/project/src/data/ (and any additional cleaning files) needed to clean 
# or prepare your data. Then save/write the cleaned file as an .Rds file in 
# to the cleaned data directory, pages/project/src/data/cleaned, using here() 
# to build the file path. Appending a _cleaned suffix also clarifies the 
# nature of the file. After you have saved your cleaned file version, ensure 
# that you read in the cleaned version instead of the raw file. A simple read
# line makes this process apparent. 
#
# If you do not need to clean your data, remove the source() call to the 
# cleaning script: pages/project/src/data/data_cleaning.R, and then delete it
# if you are sure that you do not need it.
#
################################################################################
# Load necessary libraries/source any functions
library(dplyr)
library(here)

################################################################################
# read raw data with {here} for path management
mtcars <- readRDS(here("pages", "project", "data", "mtcars.Rds"))

################################################################################
# clean data
# if cleaning is not needed for your project, either:
# (a) comment out the cleaning script and adjust path to read the raw file
# (b) save the raw data as a cleaned version

mtcars_cleaned <-
  mtcars |>
  # document step
  filter(mpg < 22)

################################################################################
# save cleaned data as .Rds file with {here} for path management

saveRDS(
  object = mtcars_cleaned,
  file = here("pages", "project", "data", "cleaned", "mtcars_cleaned.Rds")
)


################################################################################
# End of script
