fluidRow(column(width = 3,
                wellPanel(
                h4("Example Plots"),
                
                radioButtons("type_plot", "Choose an example plot:",
                             choices = c("PCA" = 'pca',
                                         "MDS" = 'mds'),
                             selected = 'pca')

  )),
  
  column(width = 9,
         
         conditionalPanel(condition = ("input.type_plot == 'pca'"),
         
         fluidPage(tabsetPanel(
         
         tabPanel("Scree Plot", plotlyOutput("scree")),
         tabPanel("Score Plot", plotlyOutput("score"))
         ))),
         
         conditionalPanel(condition = ("input.type_plot == 'mds'"),
                          
         fluidPage(tabsetPanel(
           
         tabPanel("Distance Plot", plotlyOutput("distance"))
           
         )))
  
  )
)

