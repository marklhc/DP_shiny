library(shiny)

shinyServer(
  function(input, output) {
    df <- reactive(input$N1 + input$N2 - 2)
    s2 <- reactive(((input$N1 - 1) * input$sd1^2 + (input$N2 - 1) * input$sd2^2) / 
      df())
    cohen.d <- reactive((input$mean1 - input$mean2) / sqrt(s2()))
    cm <- reactive(exp(lgamma(df() / 2) - log(df() / 2) / 2 - lgamma((df() - 1) / 2)))
    output$cohen.d <- renderPrint({cohen.d()})
    output$hedges.g <- renderPrint({cohen.d() * cm()})
  }
)