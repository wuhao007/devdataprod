library(shiny)
x <- 0
x <<- x + 1
y <<- 0

shinyServer(
  function(input, output) {
    y <<- y + 1
    x <- reactive({as.numeric(input$text1)+100})
    output$text1 <- renderText({x()      })
    output$text2 <- renderText({x() + as.numeric(input$text2)})
    output$text3 <- renderText({
      if (input$goButton == 0) "You have not pressed the button"
      else if (input$goButton == 1) "you pressed it once"
      else "OK quit pressing it"
      input$goButton
      isolate(paste(input$text1, input$text2))
    })
    output$text4 <- renderText(y)
    output$text5 <- renderText(x())
    
  }
)
