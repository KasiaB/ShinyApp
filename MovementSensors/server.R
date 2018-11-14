library(shiny)
library(dplyr)
library(ggplot2)

shinyServer(function(input, output) {
   
  output$chosenPlot <- renderPlot({
      load("data_plot.RData")
      dataset <- sample_n(data_plot,input$n)
      plot_choice <- switch(input$plot_choice,
                            full={
                                pred_test=dataset$pred_test_full
                                accurate_pred=dataset$accurate_pred_full
                                ggtitle="Actual and predicted values based on four sensors"
                            },
                            forearm={
                                pred_test=dataset$pred_test_forearm
                                accurate_pred=dataset$accurate_pred_forearm
                                ggtitle="Actual and predicted values based on forearm sensor"
                            },
                            arm={
                                pred_test=dataset$pred_test_arm
                                accurate_pred=dataset$accurate_pred_arm
                                ggtitle="Actual and predicted values based on arm sensor"
                            },
                            belt={
                                pred_test=dataset$pred_test_belt
                                accurate_pred=dataset$accurate_pred_belt
                                ggtitle="Actual and predicted values based on belt sensor"
                            },
                            dumbbell={
                                pred_test=dataset$pred_test_dumbbell
                                accurate_pred=dataset$accurate_pred_dumbbell
                                ggtitle="Actual and predicted values based on dumbbell sensor"
                            })
      ggplot(aes(x=testclass, y = pred_test,colour=accurate_pred),data = dataset) + 
          geom_jitter(size=2,alpha=0.5,width = 0.3, height = 0.3) + ggtitle(ggtitle) +
          xlab("Actual category") + ylab("Predicted category")
  })
  
})