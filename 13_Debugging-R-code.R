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
# - Use Q to exit the debugger and return to the R prompt


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

# recover() is used as an error handler, by calling
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


### 13.3.2 debug() ----

# If you have control of the code (because you are the one writing it),
# using browser() is generally the most convenient way to enter the debugger.

# However, if the error occurs in code inside of a package, what options do you have?

# This is where the debug() function is useful, as it will open the
# R debugger on any function, including those inside of packages:
debug(ggplot2::ggplot)
# You can use the `::` syntax to find "exported" functions inside a package,
# but there is also a way to access *any* function,
# including un-exported ones, with `:::`.
debug(ggplot2:::set_last_plot)

# undebug() is used to remove the debugging code.
undebug()


### 13.3.3 trace() ----

# debug() has the drawback that it always executes the first time a function
# is called.

# trace() is a more flexible version of debug() that lets you start a debugger
# at the start of a function, and lets you insert *any* code at *any* location
# inside of a function.

# The downside is that trace() is harder to use than debug().

# If called without any additional arguments, trace() simply prints a message
# when the function is entered.

# If called with a function as the second argument, this inserts the function
# at the start of the function.
# trace(fun, browser) is equivalent to debug(fun).
# browser() or recover() are the most useful functions to use,
# but this could be any R function or regular R expression.
# It is useful to open the debugger only when certain conditions are met:
trace(what = print, tracer = quote(if (is.numeric(x) && x >= 3) cat("hi\n")), print = FALSE)
# Tracing function "print" in package "base"
# "print"

print(1)
# 1

print(3) 
# hi
# 3

# Use untrace() to remove the tracing code
untrace(print)
# Un-tracing function "print" in package "base"

print(3)
# 3


# You can also use the "at" argument to trace() to insert the tracing expressions
# at other points in the function body.
# To determine the number of the expression to  insert convert the body
# of the function to a list, e.g.
# as.list(body(fun))


## 13.4 Debugging in R Markdown documents ----

# One special case where it can sometimes be more difficult to debug is
# when an error occurs only when knitting an R Markdown document.

# The easiest way to debug most of the errors is to run the code inside the
# chunck as regular R code in the console and use the normal techniques such as
# inserting browser() calls.

# However, rarely will an error only occur when the code is being knitted.
# In this case you can set an error handler with the following code.

# First you need to modify recover() slightly, by adding a sink() call 
# to the beginning, which disables the sink() used by "knitr" internally.

# We do this by using trace().
# This can be run in a setup block or in your R console before calling
# knitr::knit() or rmarkdown::render()
trace(what = recover, tracer = sink)
# Tracing function "recover" in package "utils"
# "recover"

# Then add the following knitr chunk options to the chunk which is failing.
# error = FALSE, R.options = list(error = recover).

# Then knit the file on the R console with knitr::knit() or rmarkdown::render().
# The traceback will contain all of the knitr calls as well, so you will need to look
# near the end to find the calls in your code.

# Note that you *cannot* use the "Knit" button in RStudio when trying to debug
# R Markdown documents in any case.
# The "Knit" button opens a separate R process, so there is no way to use an interactive
# debugger in that case.


# END