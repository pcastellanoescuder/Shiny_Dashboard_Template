fluidRow(column(width = 3,
                wellPanel(
                h4("Correlation between:"),

                selectInput("one",label="Variate 1", choices = NULL),
                
                h4("and"),
                
                selectInput("two",label="Variate 2", choices = NULL)
                                 )

  ),
  
  column(width = 9,
         
         fluidPage(tabsetPanel(
         
         tabPanel("Correlation", plotlyOutput("cor_plot"),
                  br(),
                  textOutput("text"))
         )))
  )


