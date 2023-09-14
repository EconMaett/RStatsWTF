# 03 - Project-oriented workflow -----

## 3.1 We need to talk about setwd("path/that/only/works/on/my/machine") ----

# Files that use the setwd() command will not work
# on someone else's machine.

# Ideally, setwd() would only be used at the very start of the file.

# setwd() has to be set to the top-level of the project.
# Then always build subsequent paths relative to the top-level.


## 3.3 Organize work into projects (colloquial definition) ----

## 3.5 IDE support for projects ----

# The RStudio IDE has R-Projects.
# RStudio leaves a file, e.g., foofy.Rproj, in the folder,
# which is used to store settings specific to the project.

# Use File > New Project to get started.

# Double-click on a .Rproj file to open a fresh instance of RStudio,
# 2with the working directory (getwd()) and file browser
# pointed at the project folder.


### 3.5.1 Tricks for opening projects ----

# You may have a dedicated folder for your projects.
# RStudio knows about recently used Projects
# There are application launcher apps that help you find and launch
# .Rproj files.


### 3.6.1 Project-specific shortcut on Windows ----

# After installing R, you will have a shortcut to Rgui.exe
# on your desktp and  somewhere on the Start menu file tree,
# and perhaps also in the Quick Launch part of the taskpar.

# Create a copy of this shortcut for each project.
# Rigth-click the new shortcut, select "Properties...",
# and change the "Start in" field to the folder where the project
# livves.

# Launch R in a project by double-clicking its suitablyöprepared shortcut.


