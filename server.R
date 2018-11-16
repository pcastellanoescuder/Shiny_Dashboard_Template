# server.R

options(shiny.maxRequestSize = 100*1024^2)

source("helpers.R")
print(sessionInfo())

shinyServer(function(input, output,session) {
  
  ## Server functions are divided by tab
  ## 
  source("server-inputdata.R",local = TRUE)
  source("server-plot.R",local = TRUE)
  #source("server-xxxx.R",local = TRUE)
  #source("server-xxxx.R",local = TRUE)
  #source("server-xxxx.R",local = TRUE)
  #source("server-xxxx.R",local = TRUE)
  
})