library(future)
plan(multiprocess)

#* @get /
api_version <- function(){
  version <- list(Version = "0.0.1", 
                  Comments = "use future to handle api calls asynchronously")
  return(version)
}


#* @get /a
a <- function(){
  process_a %<-% {
       Sys.sleep(2)
       current_pid <- Sys.getpid()
       return(current_pid)
  }
 output <- list("Handled in pid: " = process_a)
 output
 }

#* @get /b
b <- function(){
  process_b %<-% {
       Sys.sleep(2)
       current_pid <- Sys.getpid()
       return(current_pid)
  }
 output <- list("Handled in pid: " = process_b)
 output
}

#* @get /c
c <- function(){
  process_c %<-% {
       Sys.sleep(2)
       current_pid <- Sys.getpid()
       return(current_pid)
  }
 output <- list("Handled in pid: " = process_c)
 output
}
