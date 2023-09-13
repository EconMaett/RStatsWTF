# 10 - Reproducible Environments ----

## 10.1 posit package manager ----

# URL: https://p3m.dev/client/#/

# Package Manager's web-based user interface

# After clicking the **Get Started** button on the welcome page,
# you are taken to the main page.

# On the left navigation bar is the list of package repositories
# configured in the Posit Package Manager.
# Click on a repository to work with.

# On the top screen, the name of the selected repository is displayed,
# followed by links to view additional details.

# The Setup page rpovides instructions to configure your R or Python
# environment to obtain its packages from the Package Manager.

# For R:
# 1. Set the R distribution corresponding to your installation environemnt
# 2. Obtain the desired repository URL for your needs
# 3. Configure your R environment to use the new repository URL.


### 1 Setting your Distribution for R Binary Packages ----

# The Posit Package Manager provides R packages for Windows and lInux.
# By configuring which distribution you are installing to, it ensures a 
# binary is compatible with your environment and displays instructions on 
# how to install any other system dependencies you may need.

# To set your distribution, click the **Distribution** link
# in the top right corner of the screen and select the desired installation
# environment.

### 2 Obtaining a repository URL ----
# Package installation tools in R and Python are by default configured to
# access packages form public package repositories such as 
# CRAN, Bioconductor, PyPi, rOpenSci, etc.

# Your environment must be reconfigured by changing the repository
# URL in your client.

#### Getting the latest package available -----

# 1. Select a repository form the list on the left of the page,
#    then click the **Setup** button at the top of the screen.
# 2. Ensure the **Latest** button is selected (blue)
# 3. The configured rpository URL is displayed below the calender, e.g.,
#    https://packagemanager.posit.co/cran/__Windows__/centos7/latest

# 4. Click the **Copy** button to copy the URL to your clipboard.

#### Getting frozen URLs for improving reproducibility. ----

# - A popular feature of the Posit Package Manager is date-based
# snapshots.

# - A user specifies a date, and the Posit Package Manager provides 
#   a collection of packages limited to what was available on that date.

# 1. Select a repository form the list on the left of the page,
#   then click the **Setup** button at the top of the screen.

# 2. Scroll the calendar to select a snapshot date.
#   Dates with an available snapshot are indicated by a box around the day.
#   The **Freeze** button will be selected automatically.

# 3. The configured repository URL is displayed below the calendar.

# 4. Click the **Copy** button to copy the URL to your clipboard.

# Tip: For R projects that require strict reproducibility, selecting the
# **Lock Package Data** check box will guarantee you always receive 
# the same packages.
# However, for improved flexibility, we recommend leaving this unchecked to
# allow for simpler repository URLs.

# For Python projects that require strict dependency management, 
# we recommend using requirements.txt or pivenv lock.


### Configuring R Environments ----

# Once you have obtained the repository URL, your environment must be confiugred
# to use the URL to download and install packages.

#### Base r ----

# To configure R to use the Posit Package Manger as its CRAN repsoitory,
# set the "repos" option to use the repository URL:
options(repos = c(CRAN = "https://packagemanager.posit.co/cran/__linux__/centos7/latest"))

# Alternatively, instead of replacing your default URL, 
# additional repositories can be added to your existing configuration.
# For example:
local(expr = {
  repos <- c(PackageManager = "https://packagemanager.posit.co/cran/__linux__/centos7/latest")
  repos["LocalPackages"] <- "https://packagemanager.posit.co/local/__linux__/centos7/latest"
  
  # add the new repositories first, but keep the existing ones
  options(repos = c(repos, getOption("repos")))
})

# verify the current repository list
getOption("repos")

# The same code can be added to your R start up file
# Rprofile.site or .Rprofile to maintain the repository configuration
# across R sessions.

?local
# locate() is like eval(), evalq(), eval.parent(),
# a base R function to evaluate an unevaluated expression.


## Viewing Package Details ----

# The **Packages** page allows you to search or browse available packages.


## 10.2 renv ----
# URL: https://rstudio.github.io/renv/

# The "renv" package helps you create reproducible environments for
# your R projects.

# renv makes your R projects more isolated, portable and reproducible

# - Isolated: Installing a new or updated package for one project won't break other projects.
#   renv gives each project its own private library.

# - Portable. Easily transport your projects from one machine to another,
#   or even across platforms.
#   renv helps you install packages your project depends on.

# - Reproducible: renv records the exact package versions you depend on,
#   and ensures those exact versions are the ones that get installed.

library(renv)

### Workflow ----

# Use renv::init() to initialize renv in a new or existing project.
# This will set up a project library, containing all the 
# package s you are currently using.

# The packages and the metadata needed to reinstall them
# are recorded in a lockfile, renv.lock, and a .Rprofile
# ensures that the library is sued every time you open that project.
renv::init()

# ?renv::paths
# vignette("renv")

# As you continue to work on oyur project, you will install and upgrade
# packages, either using install.packages() and update.packages() or
# renv::install() and renv.:update().

# After you have confirmed your code works as expected, use
# renv::snapshot() to record the packages and their sources 
# in the lockfile
renv::install("dfms")
renv::snapshot()
# Later, if you need to share your code with someone else or
# run your code on a new machine, your collaborator (or you) 
# can call renv::restore() to reinstall the specific package
# versions recorded in the lockfile.
renv::restore()

# deactivate renv in a project:
renv::deactivate()

