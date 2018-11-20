# ui.R
source("helpers.R")
# UIs script

dashboardPage(skin = "blue", 
  dashboardHeader(title = h2("Shiny Dashboard Template"),
                  titleWidth = 800),
  
  
  dashboardSidebar(sidebarMenu(
    menuItem("Home", tabName = "home"),
    menuItem("Input Data", tabName = "inputdata"),
    menuItem("Plot", tabName = "plot"),
    menuItem("About", tabName = "about") #,
    #menuItem("xxxx", tabName = "xxxx"),
    #menuItem("xxxx", tabName = "xxxx"),
    #menuItem("xxxx", tabName = "xxxx")
    
  )),
  dashboardBody(            

  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "mycss.css")
  ),
    
    tabItems(
      tabItem(tabName = "home",
              source("ui-tab-landing.R",local=TRUE)$value),
      tabItem("inputdata",
              source("ui-tab-inputdata.R",local=TRUE)$value),
      tabItem("plot", 
              source("ui-tab-plot.R",local=TRUE)$value),
      tabItem("about", 
              source("ui-tab-about.R",local=TRUE)$value) #,
      #tabItem("xxxx", 
      #        source("ui-tab-xxxx.R",local=TRUE)$value),
      #tabItem("xxxx", 
      #        source("ui-tab-xxxx.R",local=TRUE)$value),
      #tabItem("xxxx", 
      #        source("ui-tab-xxxx.R",local=TRUE)$value)
      
      ),
    
    #########################################   
    tags$hr(),
    #########################################
    ## FOOTER
    #########################################  
    tags$footer(p(h5(("Pol Castellano Escuder"), align="center",width=3)),
                p(("Copyright (C) 2018, code licensed under GPLv3"),align="center",width=4),
                p(("Code available on Github:"),
                  a("https://github.com/pcastellanoescuder/Shiny_Dashboard_Template",
                    href="https://github.com/pcastellanoescuder/Shiny_Dashboard_Template"),
                  align="center",width=4))
  ) 
) 

