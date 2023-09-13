# 13 - Debugging R code ----

## 13.1 Debugging your own code ----

# - Use traceback() to determine where a given error is occurring.
# - Output diagnostic information with print(), cat(), or message() statements.
# - Use browser() to open an interactive debugger before the error
# - Use debug() to automatically open a debugger at the start of a function call
# - Use trace() to start a debugger at a location inside a function


### 13.1.1 traceback() ----

# The traceback() function prints a summary of how the program
# arrived at the error.
# This is called a call stack, stack trace, or back-trace.

# In R this gives you each call that lead up to the error.

# You can call traceback() immediately after
# the error has occurred:
f <- function(x) x + 1
g <- function(x) f(x)
g("a")
# Error in x + 1 : non-numeric argument in binary operator
traceback()
# 2: f(x) at #1
# 1: g("a")

# Or by using traceback() as an error handler, which will
# call it immediately on any error.
# You could even put this in your .Rprofile
options(error = traceback)
g("a")

usethis::edit_r_profile()

### 13.1.2 print() ----

# Once you know where an error occurs you want to know why.

# Usually an error occurs because a function was given an input
# its authors did not expect.
# Therefore you want to print the value of objects during execution.

# Besides print(), str() is useful because it gives you
# the structure of the object, which may be different from what you expect.

### 13.1.3 browser() ----

# Put a call to browser() in your code to stop execution
# at the point of th error and open R's interactive debugger.

# Inside fo the debugger you can run any R command to look
# at objects in the current environment, modify them
# and continue executing.

# Useful things to do are:
# - Use ls() to see what objects are in the current environment.
# - Use str(), print() etc to examine objects.
# - Use where to print a stack trace
# - Use c to leave the debugger and continue execution
# - Use Q to exit the debuger and return to the R prompt

## 13.2 Debugging in RStudio ----

### 13.2.1 Editor breakpoints ----
# You can click to the left of the line number in the source
# file where you want to put the break point, or
# press Shift + F9 with your cursor on that line.

# A breakpoint is equivalent to a browser() call.


### 13.2.2 Stopping on error ----

# You can control error behavior with 
# Debug -> On Error -> Error Inspector

### 13.2.3 Debugging console ----

# The RStudio debugging console has a few buttons to make debugging 
# nicer, they are
# next (n), step into (s), continue (c), and Quit (Q)

## 13.3 Debugging others' code ----

# Use recover(), debug(), and trace()

### 13.3.1 recover() ----

# recover() is used as an errror handler, by calling
options(error = recover)

# You can also use other functions, such as browser() as an
# error handler, which will start the debugger
# automatically when there is an error.

# The benefit of options(error = recover) over options(error = browser)
# is that you can browse on any of the call stack, not just where the
# error occurred.

# Often the issue is most easily diagnosed in calls higher on the
# stack than immediately where the error occurred.

# When recover() is called it prints a list of the current calls,
# with a prompt to select which you want to browse in.

# Then a debugging session is started at that location.


