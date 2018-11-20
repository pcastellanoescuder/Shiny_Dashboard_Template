Selection2 <- 
  
  reactive({

      data <- datasetInput()
      colnames(data)[1] <- "ID"
      
      x <- colnames(data)
      updateSelectInput(session,"one", choices = x[2:length(x)], selected = x[2])
      updateSelectInput(session,"two", choices = x[2:length(x)], selected = x[3])
      print(data)
    
  })


Correlations <-
  
  reactive({
                    
    data <- Selection2()
    
    One <- as.character(input$one)
    Two <- as.character(input$two)
    
    One.df <- as.data.frame(data[,colnames(data) == One])
    
    Two.df <- as.data.frame(data[,colnames(data) == Two])
    
    TOTAL <- cbind(One.df, Two.df)
    colnames(TOTAL) <- c("Variate 1", "Variate 2")

    
    correlation_plot <- ggplotly(ggplot(TOTAL, aes(x = `Variate 1`, y = `Variate 2`)) + 
                                   geom_point() +
                                   theme(legend.position="none") + 
                                   theme_minimal())
    
    text_cor <- round(cor(TOTAL$`Variate 1`, TOTAL$`Variate 2`),3)
    
    return(list(correlation_plot = correlation_plot, text_cor = text_cor, One = One,
                Two = Two))

  })


###########

output$cor_plot <- renderPlotly({
  Correlations()$correlation_plot
})

output$text <- renderText({
  
  paste0("The correlation between ", Correlations()$One, " and " , Correlations()$Two, " is ",
         Correlations()$text_cor)

})

