# 04 - Practice safe paths ----

## 4.1 Use projects and the "here" package ----

# Avoid setwd() at the top of every script by:
# - Organizing each project into a folder
# - Make sure the top-level folder advertise itself as such.
#   Have an empty file named ".here".
# - Use here::here() to build the path when you read or write
#   a file. Create paths relative to the top-level directory.

# Example:
library(ggplot2)
library(here)
write.csv(AirPassengers, file = here("data", "AirPassengers.csv"))
df <- read.csv(file = here("data", "AirPassengers.csv"))
df
p <- ggplot(data = df, mapping = aes(x = X, y = x)) + geom_line()
p
ggsave(filename = here("figs", "AirPassengers_lineplot.png"))

# This will run, with no edits, for anyone who follows the
# convention about launching R in the project folder.

# In fact, it will even work if R's working directory is anywhere
# inside the project, i.e. it will work from sub-folders.

# This plays well with knitr/rmarkdown's default behavior around
# working directory and in pacakge development/checking workflows.

