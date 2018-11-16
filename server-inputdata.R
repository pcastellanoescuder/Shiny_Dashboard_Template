
datasetInput <- reactive({
  
  infile <- input$data

  if (is.null(infile)){
      return(NULL)
  } else {
    data <- read_csv(infile$datapath)
    return(data)
    }
})

#################
                  
output$mydata <- DT::renderDataTable(datasetInput())

