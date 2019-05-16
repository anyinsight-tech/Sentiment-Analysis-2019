library(shiny)
library(plotly)
shinyUI(fluidPage(
  
  headerPanel("Twitter Sentiment Analysis"),
  textOutput("time"),
  
  # Getting User Inputs
  sidebarPanel(
    textInput("hashtag", "Enter topic to be searched with '#'", "#"),
    submitButton(text="Analyse"),
    textOutput("text")
  ),
  
  mainPanel(
    
    tabsetPanel(
      tabPanel("Histogram", HTML("<div><h3>Emotion Type for your selected hashtag<h3></div>"), plotlyOutput("plot")),
      tabPanel("Word Cloud",HTML("<div><h3>Words associated with the hashtag</h3></div>"),plotOutput("wordcloud"))
))))
