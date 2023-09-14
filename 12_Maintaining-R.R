# 12 - Maintaining R ----

## 12.1 How to upgrade an installed package to the latest version ----


### 12.1.1 In RStudio ----

# RStudio has an update dialog. 
# Go to the Packages Tab -> Update.
# Check packages to update them.

### 12.1.2 R terminal ----

# devtools::update_packages() will upgrade a package
# from the same source for *any* CRAN or development package.
# devtools::update_packages("pkgname")
# In addition, if the given package is *not* already installed,
# it will install it first.

## 12.2 How to upgrade all out-of-date packages ----

# In RStudio, click the "Select All" button to update all
# packages: Packages Tab -> Update -> Select all

### 12.2.2 CRAN packages ----
devtools::update_packages(TRUE)


## 12.3 How to downgrade a package ----
# devtools::install_version("devtools", "1.13.3")


## 12.4 How to transfer your library when updateing R.

# For patch R versions, the z in x.y.z, the R core developers
# ensure package compatibility across versions.

# For minor versions, the y in x.y.z, package the package interface
# can change, so packages need to be re-installed.


# R_LIBS_USER is set by default to ~/R/win-library/x.y on Windows
# You can create such a directory using
# fs::dir_create(Sys.getenv("R_LIBS_USER"))

# You can alternatively set R_LIBS_USER to a different path
# but you need to include the %v wildcard, e.g.
# ~/R/library/%v.
# The %v is automatically expanded to the major and minor versions
# of R, so with R 3.5.1 this path becomes ~/R/library/3.5.

# You can edit R_LIBS_USER in your .Renviorn file.

# Once this is set up, the process for transferring your
# package library becomes

# Install new version of R

# Create a new directory for the verision of R
# fs::dir_create("~/Library/R/3.5/library")

# Re-start R so the .libPaths are updated

# Lookup what packages were in your old package library
# pkgs <- fs::path_file(fs::dir_ls("~/Library/R/3.4/library"))

# Filter these packages as needed

# Install the packages in the new session
# install.packages(pkgs)

