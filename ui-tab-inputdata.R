tabPanel("Input Data", 
         fluidRow(column(width = 2,
                         
                         wellPanel(

                  fileInput("data",
                            "Upload your data (.csv):",
                            accept = c(
                              "text/csv",
                              "text/comma-separated-values,text/plain",
                              ".csv")),
                  helpText("This template example take",
                           "first column as rownames")
                  
                  )),

         column(10,
                
                fluidPage(tabsetPanel(
                  tabPanel("Uploaded Data", div(style = 'overflow-x: scroll', DT::dataTableOutput("mydata"), width = NULL,
                    status = "primary")))

                           ))))

