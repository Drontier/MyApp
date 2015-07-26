# server.R
# My

library(quantmod)

shinyServer(function(input, output) {



  dataInput <- reactive({	
    getSymbols(input$symb1, src = "yahoo", 
        from = input$dates[1],
        to = input$dates[2],
        auto.assign = FALSE)
  })
  
  dataInput2 <- reactive({
  	getSymbols(input$symb2, src = "yahoo",
  		from = input$dates[1],
  		to = input$dates[2],
  		auto.assign = FALSE)
  })

  
  output$plot <- renderPlot({
    chartSeries(dataInput(), theme = chartTheme("white"), 
        type = "line", log.scale = input$log, TA = NULL)
  })
  output$plot2 <- renderPlot({
    chartSeries(dataInput2(), theme = chartTheme("white"), 
        type = "line", log.scale = input$log, TA = NULL)
  })
})

