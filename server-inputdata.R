
datasetInput <- reactive({
  
  infile <- input$data

  if (is.null(infile)){
    data <- read_csv("example_data/iris.csv")
    return(data)
  } else {
    data <- read_csv(infile$datapath)
    return(data)
    }
})

#################
                  
output$mydata <- renderDataTable({

results <- datasetInput()
datatable(results, rownames=FALSE, class = 'cell-border stripe')
           
})

