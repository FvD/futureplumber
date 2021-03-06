Future Plumber
================

Asynchronous API's with Plumber
------------------------------

Plumber does not have in-built features to handle calls to the endpoints asynchronously. And perhaps this is something that need not be handled by plumber directly, but instead can be handled by the [future](https://github.com/HenrikBengtsson/future) package. A huge benefit is that **future** can do much more than just handling code asynchronously.

So as a very basic and first example we implement this example from the future README in plumber

``` r
library(future)
plan(multisession)
pid <- Sys.getpid()
pid
```

    ## [1] 27404

### Multiple pids

``` r
a %<-% {
    cat("Resolving 'a' ...\n")
    Sys.getpid()
}
b %<-% {
    cat("Resolving 'b' ...\n")
    Sys.getpid()
}
c %<-% {
    cat("Resolving 'c' ...\n")
    Sys.getpid()
}
a
```

    ## [1] 27433

``` r
b
```

    ## [1] 27453

``` r
c
```

    ## [1] 27473

It is not possible to use the `%<-%` directly in plumber, it has to be placed inside a function, like so:

``` r
in_a_function <- function(){
  a %<-% {
       cat("Resolving 'a' ...")
       Sys.sleep(2)
       cat("done\n")
       current_pid <- Sys.getpid()
       return(current_pid)
  }
  cat("Solved in pid: ", a)
}
```

And this is the basis for the first example in the folder \[multiprocess\], that uses `plan(multiprocess)` to handle all calls asynchronously (instantiates a new R process for each call).
