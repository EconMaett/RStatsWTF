# 14 - Read the source ----

# Whenever you encounter an error, you should search for the
# error message.

# You can then search the error on Google or on Stack Overflow.
# Another option is to GitHub search to shed light on your problem.


## 14.1 GitHub search ----

# GitHub allows you to search code, repositories, and issues.


## 14.2 Where things exist in the R source ----

# The SVN repository used by the R core team to develop R is mirrored on
# GitHub by Winston Chang at https://github.com/wch/r-source.

# This means that all the code used by your local R session, including
# compiled code, is searchable.

# The R source uses a complicated layout and contains the source of all the 
# code in base R (src/main) as well as the set of packages included in 
# base R, such as "stats", "graphics", "utils", and others (src/library/*).

# It also contains all of the documentation included in R such as
# "Writing R extensions", "R internals", and "R admin guides".


## 14.3 Where things exist in CRAN packages ----

# You can find the development of most R packages by looking at the URL
# field in the package DESCRIPTION,
# as can be seen on the CRAN landing page (e.g. devtools landing page).

# The "BugReports" field will give you a direct link to the issue page
# where you should report any issues found with the package.

# In addition, all code for CRAN packages is mirrored on GitHub
# by Gabor Csardi at https://github.com/cran,
# which means all the code for CRAN packages is also searchable.

# All R code in packages is kept in the R/ directory.
# In addition, if the package is using "roxygen", the source code will
# contain roxygen comments (#') with the function level documentation.

# If a package is *not* using roxygen, which is typical for older packages and
# those in base R, the documentation will be in .Rd files in the
# man/ directory (for "manual").
# Thse files also exist in roxygen packages, but are generated automatically
# and should not be edited by hand.

# If the package uses compiled code it will be in the src/ directory
# regardless of what langauge the compiled code is written in.

# Long-form documentation in the form of vignettes is stored in the
# vignettes/ directory.

# END