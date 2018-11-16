
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
                    
             #else if (input$type_plot == "mds"){}
  })



###########

output$scree <- renderPlotly({
  Plot()$screeplot
})

output$score <- renderPlotly({
  Plot()$scoresplot
})

