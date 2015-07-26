# My
library(shiny)

shinyUI(fluidPage(
  titlePanel("StockComp"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Select two stocks and a time frame to compare. 
        Information will be collected from yahoo finance."),
    
      textInput("symb1", "1st Stock Symbol", "GOOG"),
      textInput("symb2", "2nd Stock Symbol", "AAPL"),
    	
      dateRangeInput("dates", 
        "Date range",
        start = "2012-01-01", 
        end = as.character(Sys.Date())),
   
      actionButton("get", "Compare Stocks"),
      
      br(),
      br(),
      
      checkboxInput("log", "Plot y axis on log scale", 
        value = FALSE)

    ),
    
    mainPanel(
    	plotOutput("plot"),
    	plotOutput("plot2")
    )
  )
))