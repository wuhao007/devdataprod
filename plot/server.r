library(UsingR)
library(MASS)
library(HistData)
library(Hmisc)
library(grid)
library(lattice)
library(survival)
library(Formula)
library(ggplot2)

data(galton)

shinyServer(
  function(input, output) {
    output$newHist <- renderPlot({
      hist(galton$child, xlab='child height', col='lightblue', main='Histogram')
      mu <- input$mu
      lines(c(mu, mu), c(0, 200), col="red", lwd=5)
      mse <- mean((galton$child - mu) ^ 2)
      text(63, 150, paste("mu = ", mu))
      text(63, 140, paste("MSE = ", round(mse, 2)))
    })
  }
)
