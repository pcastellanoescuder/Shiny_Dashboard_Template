Selection <- 
  
  reactive({
    
    if (input$type_plot == "density"){
      
      data <- datasetInput()
      colnames(data)[1] <- "ID"
      
      x <- colnames(data)
      updateSelectInput(session,"variate", choices = x[2:length(x)], selected = x[2])
      print(data)
    }
  })


Plot <-
  
  reactive({
    
    data <- datasetInput()
    colnames(data)[1] <- "ID"
    data$ID <- as.factor(data$ID)
    df <- as.matrix(data[,c(2:ncol(data))])
                    
             if (input$type_plot == "pca"){
               
               res.pca <- prcomp(df, scale = TRUE)
               
               ev <- res.pca$sdev^2
               ev <- data.frame(comp = c(1:length(ev)), eigenvalues = res.pca$sdev^2)
               
               screeplot <- ggplotly(ggplot(aes(x = comp, y = eigenvalues), data = ev) +
                                       geom_bar(stat="identity", fill = rep(c("lightblue"),nrow(ev))) +
                                       theme_minimal())
               
               scoresplot <- ggplotly(autoplot(res.pca) + theme_minimal())
                      
               results <- list(screeplot = screeplot, scoresplot = scoresplot)
               return(results)
               
             }
  
            if (input$type_plot == "density"){

               data <- Selection()
               
               Variate <- as.character(input$variate)
              
               to_plot <- as.data.frame(data[,colnames(data) == Variate])
               colnames(to_plot) <- "Variate"
               
               Density_Plot <- ggplotly(ggplot(to_plot, aes(x = Variate)) + 
                                          geom_density(adjust=input$slider1) +
                                          theme(legend.position="none") + 
                                          theme_minimal())

               
               results <- list(Density_Plot = Density_Plot)
               return(results)

            }
  })


###########

output$scree <- renderPlotly({
  Plot()$screeplot
})

output$score <- renderPlotly({
  Plot()$scoresplot
})

output$dens_plot <- renderPlotly({
  Plot()$Density_Plot
})

