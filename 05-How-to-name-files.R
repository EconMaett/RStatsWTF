# 05 - How to name files ----

library(tidyverse)
## naming things ----

# There are three principles for file names:
# - machine readable
# - human readable
# - default ordering


### machine readable ----

# Names should be regular expression and globbing friendly:
# - avoid spaces
# - avoid punctuation
# - avoid characters
# - avoid case sensitivity

# Names should be easy to compute on:
# - Deliberate use of delimiters

# Deliberate use of "_" and "-" allows you to recover 
# metadata from filenames:
write.csv(
  x = AirPassengers, 
  file = "data/2013-06-26_BRAFWTNEGASSAY_Plasmid_Cellline-100-1MutantFraction_H01.csv"
  )
write.csv(
  x = AirPassengers, 
  file = "data/2013-06-26_BRAFWTNEGASSAY_Plasmid_Cellline-100-1MutantFraction_H01.csv"
)
write.csv(
  x = AirPassengers, 
  file = "data/2013-06-26_BRAFWTNEGASSAY_Plasmid_Cellline-100-1MutantFraction_H02.csv"
)
write.csv(
  x = AirPassengers, 
  file = "data/2013-06-26_BRAFWTNEGASSAY_Plasmid_Cellline-100-1MutantFraction_platefile.csv"
)

write.csv(
  x = AirPassengers, 
  file = "data/2013-06-26_BRAFWTNEGASSAY_Plasmid_Cellline-100-1MutantFraction_H03.cwv"
)

# Check out the files:
flist <- list.files(path = "data/", pattern = "Plasmid") |> 
  head()

flist

stringr::str_split_fixed(string = flist, pattern = "[_\\.]", n = 5)

# This is also possible in the shell, in Python, etc.

# We have recovered metadata from the files, namely
# date, assay, sample set, well

# It folows:
# - Use the underscore "_" to delimit units of meta-data you might
#   want later

# - Use the hyphen "-" to delimit words so your eyes don't bleed.


# machine readable names means:
# - easy to search for files later
# - easy to narrow file lists based on names
# - easy to extract info from file names, e.g. by splitting

# New to regular expressions and globbing?
# Avoid:
# - spaces in file names
# - punctuation
# - accendted characters
# - different files named "foo" and "Foo"

# human readable names means:
# - names contain info on the content of the file
# - connect to the concept of a slug from semantic URLs

# Examples of human readable file names:
# 01_marshal-data.r
# 02_pre-filtering.r
# 03_explore-results.r
# helper01_load-data.r
# helper02_extract-and-tidy.r

# Default ordering:
# - put numbers first
# - use ISO 8601 standard for dates
# - left pad other numbers with zeros

# Enforce chronological order with ISO 8601 standard for dates
# Enforce logical order with slugs like helper01_, helper02_

