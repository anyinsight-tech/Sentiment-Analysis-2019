library(shiny)
library(plotly)
shinyUI(fluidPage(
  
  headerPanel("Twitter Sentiment Analysis"),
  textOutput("time"),
  
  # Getting User Inputs
  sidebarPanel(
    selectInput("hashtag" , "Choose a trending topic to analyse!", c("Game of Thrones", "Avengers: End Game", "James Charles")),
    textOutput("text")
  ),
  
  mainPanel(
    
    tabsetPanel(
      
      tabPanel("Histogram", HTML("<div><h4>Emotion Type for your selected hashtag<h4></div>"), plotlyOutput("plot"), HTML("<div>The graph takes minutes to generate, please be patient...</div>"))
  
))))
