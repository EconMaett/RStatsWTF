# 08 - R Startup ----

# Most R users can ignore the complexity of R's startup process and
# focus on two main files:
# - .Renviron - which contains environment variables to be set in R sessions
# - .Rprofile - which contains R code to be run in each session

# These files are R specific instances of a broader family of customization
# files commonly referred to as "dotfiles".

# They are used to tailor the behavior of many programs, 
# particularly those with roots in the unix command line.

# Many people store their dotfiles on GitHub and you may find
# inspiration by looking at other people's dotfile repositories.


## 8.1 .Renviron ----

# The .Renviron file is most useful for dfining sensitive ifnormation
# such as API keys for GitHub or twitter,
# as well as R specific environment variables like history size
# R_HISTSIZE=100000 and default library locations R_LIBS_USER

# The .Renviron file contains lists of environment variables to set.
# This is *not* R code, but uses a format similar to that of the command line shell.

# The easiest way to edit .Renviron is by running
usethis::edit_r_environ()
# Currently, my .Renviron file only contains my 
# FRED API key
# FRED_API_KEY=c6111687930cefedd1119a2c7263fa3e


## 8.2 .Rprofile ----

# The .Rprofile contains r code to be run when R starts up.
# It is run after the .Renviron file is sourced.
# Typically, .Rprofile is located in the user's home directory
# ~/.Rprofile, however, a different location can be configured
# by setting the R_PROFILE_USER enironment variable.

# The easiest way to edit .Rprofile is by running
usethis::edit_r_profile()
# My .Rprofile file is currently empty.

# Some common things people add to their .RProfile is:
# - Set a dfault CRAN mirror
# - Write a welcome message
# - Customize their R prompt
# - Change options, screen width, numeric display
# - Load frequently used packages (be careful!)
# - Aliases / shortcuts for frequently used functions 


### 8.2.1 Reproducibility ----

# Only put things in your .Rprofile that you run interactively
# in the R terminal.
# If it ever appears in an R script or R Markdown file it should
# *not* be in your .Rprofile.

# Problematic examples are loading packages used in your 
# analysis such as tidyverse or changing default
# options that change the value of outputs such as
# options(stringsAsFactors = FALSE).

# If you try to run your scripts on another system without your
#.Rprofile it will no longer be reproducible.

# Because the .Rprofile is run by every R process, including those
# started by R itself, it is important to guard most of the code
# with interactive(), so it is only run in interactive sessions,
# i.e., sessions you are controlling with a termina..

usethis::edit_r_profile()


## 8.3 Disabling startup files ----

# You can run R without any startup files by using the
# --vanilla argument when starting R.

# In RStudio you can do this by checking the option
# Project Options > Disable .Rprofile execution on start / resume.

# You can also selectively disable only the user or site .Rprofile
# with --no-init-file and --no-site-file respectively, 
# and disable the environment with --no-environ.

