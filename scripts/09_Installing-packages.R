# 09 - Installing packages ----

## 9.1 A highly simplified package lifecycle ---

# Source
# devtools::build()
# Bundled
# devtools::build(binary = TRUE)
# Binary
# install.packages()
# Installed
# library()
# Loaded

## 9.2 Binary packages ----
# - where to get them
# - how to know you got them

## 9.3 Source packages ----

# The most common type of package you install is a binary
# package.

# Packages released on CRAN are built as pre-compiled binaries.

# Sometimes you need to install packages that do not have a
# pre-built binary version available,
# e.g., when you want to install development versions not yet 
# released on CRAN or older versions of released packages.

# It also lets you build your own packages locally.

# To install a source package, you need to setup a development
# environment.

# The two main functions used to install source pacakges are:
# - devtools::install_dev() to intall the latest development version of a CRAN package.
# - devtools::install_github() to install a package directly from GitHub, even if it is not on CRAN.
# - devtools::install_version() to install previously released CRAN versions of a package.

# You can also fork, clone and work with a package directly 
# then use devtools::install() and devtools::load_all() to work
# with the package locally like you would with a package you have
# created yourself.


## 9.4 Installation of a temporary library ----

# Sometimes you want to install packages to a temporary library,
# so they do not affect your normal packages.

# Use the "lib" argument to the devtools::install() functions,
# the use lib.log inlibrary() when you load the package:
library(devtools)

tmp_lib <- "tmp/tmp_library"
dir.create(tmp_lib, recursive = TRUE)

devtools::install_github(repo = "dill/beyonce", lib = tmp_lib)

# restart R
# Ctrl + Shift + F10

# explicitly load the affected packages from the temporary library
tmp_lib <- "tmp/tmp_library"
library(beyonce, lib.loc = tmp_lib)

# Clean up!
unlink(tmp_lib, recursive = TRUE)
