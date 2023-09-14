# 02 - Saving Source and Blank Slate ----
# URL: https://rstats.wtf/

## 2.1 Save source, not the workspace ----

## 2.3 Always start R with a blank slate ----

# When you quit R, do not save the the workspace to
# an .Rdata file.
# When you launch, do not reload the workspace from
# an .Rdata file.

# - In RStudio, go to Tools > Global Options
# - Remove the tick in the box "Restore .RData
# into workspace at startup"
# - Set "Save workspace to .RData on exit" to "Never"

# usethis::use_blank_slate() prints a reminder
# about how to do this.


## 2.4 Restart R often during development ----

# In RStudio, go to Session > Restart R or use the shortcut
# Ctrl + Shift + F10


### 2.5 What is wrong with rm(list = ls())? ----
ls()
?ls
# ls() and objects() return a vector of character strigns
# giving the names of objects in the specified
# environment.

# When invoked with no argument at the top level prompt,
# ls() shows what data sets and functions a user has defined.

# when invoked with nor argument inside a function,
# ls() returns the names of the function's 
# local variables.
# -> This is useful in conjunction with browser8)
.Ob <- 1
ls(pattern = "O")
ls(pattern = "O", all.names = TRUE)
# ".Ob"

# shows an empty list
myfunc <- function() { ls() }
myfunc()

# define a lcoal variable inside myfunc
myfunc <- function() { y <- 1; ls() }
myfunc()
# "y"

# rm(list = ls()) is a red flag because it is highly suggestive
# of a non-reproducible workflow.

# All it does is delete the user-created objects from the global
# workspace.

# Many other changes persist invisibly:
# - Any packages that have been set to non-default values remain that way.
# - The working diretory is not affected (see getwd()).


## 2.6 Objects that take a long time to create ----
# Isolate computationally demanding steps in their own scripts
# and write the resulting object to file with
# saveRDS(my_ojbect, here("results", "my_object.rds"))
?saveRDS
# Serialization interface for single objects.
# saveRDS(), readRDS(), infoRDS()


## 2.7 Automated workflows -----

# Automating a workflow means running a set of scripts in
# sequence, using a GNU Make or writing a pseudo-Makefile in R.

# You can use a "controller" script to run other R scripts
# or render multiple RMarkdown documents.

# The "callr" package can be used to source() or render() 
# the .R or .Rmd files in their own R session.

# The R package "targets"can also be used to automate workflow.


## 2.8 Links to other resources ----

# END
