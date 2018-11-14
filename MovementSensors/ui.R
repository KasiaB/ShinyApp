library(shiny)
con <- url("https://github.com/KasiaB/ShinyApp/raw/gh-pages/MovementSensors/data_plot.RData")
load(con)

shinyUI(fluidPage(
  titlePanel("Movement Sensors in Prediction of Accuracy of Exercise Quality"),
  sidebarLayout(
      sidebarPanel(
          sliderInput("n", "Choose the number of datapoints to plot:", 0, nrow(data_plot), nrow(data_plot)),
          radioButtons("plot_choice","Choose predictors:",
                       c("Forearm sensor"="forearm",
                         "Arm sensor"="arm","Belt sensor"="belt","Dumbbell sensor"="dumbbell","All four sensors"="full"))
    ),
    mainPanel(
        h4("The application allows to visually compare several models' predictions of the quality of the Unilateral Dumbbell Biceps Curl. Six athletes were asked to perform 
           10 repetitions of the exercise either in the right way (category A) or making one of 
           four common mistakes (categories: B, C, D and E). The movements of the athletes were registered by four sensors attached to their 
           belt, forearm, arm, and dumbbell."),
        tags$a(href="http://web.archive.org/web/20161224072740/http:/groupware.les.inf.puc-rio.br/har", "More information is to be found here."),
        h4("The original study involved using all four sensors to predict the quality of performance. The random forest classification 
           procedure provided highly accurate predictions (of over 99.5%). The current project demonstrates additionally random forest predictions based on readings from each single sensor."),
        h4("In the top left panel you can choose to plot predicted and actual values based on readings 
           from all four sensors or from a single selected sensor (i.e. forearm, arm, belt or dumbbell). You can choose to plot all the test data and predictions or just a subset of selected size. Use the slider to select the sample size."),
        h4("The dots forming rectangular shapes along the diagonal line indicate correct predictions, 
           while the ones falling outside of the diagonally distributed rectangles indicate missclassifications to the respective categories."),
        plotOutput("chosenPlot")
    )
  )
))