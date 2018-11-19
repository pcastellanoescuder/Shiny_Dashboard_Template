fluidRow(column(width = 3,
                wellPanel(
                h4("Example Plots"),
                
                radioButtons("type_plot", "Choose an example plot:",
                             choices = c("PCA" = 'pca',
                                         "Density Plot" = 'density'),
                             selected = 'pca'),
                
                conditionalPanel(condition = ("input.type_plot == 'density'"),
                                 
                                 selectInput("variate",label="Variate", choices = NULL),
                                 sliderInput("slider1", label = "Bandwith Adjustment",
                                             min = 0.5, max = 4, value = 1)
                                 )

  )),
  
  column(width = 9,
         
         conditionalPanel(condition = ("input.type_plot == 'pca'"),
         
         fluidPage(tabsetPanel(
         
         tabPanel("Scree Plot", plotlyOutput("scree")),
         tabPanel("Score Plot", plotlyOutput("score"))
         ))),
         
         conditionalPanel(condition = ("input.type_plot == 'density'"),
                          
         fluidPage(tabsetPanel(
           
         tabPanel("Density Plot", plotlyOutput("dens_plot"))
           
         )))
  
  )
)

