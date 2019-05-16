# Load the required Packages
library(shiny)
library(twitteR)
library(RCurl)
library(httr)
library(tm)
library(wordcloud)
library(syuzhet)

shinyServer(function(input, output, session) {
  # Create object for reactive value
  store_value <- reactiveValues(value = character())
  
  # Update when input changes
  observeEvent(input$hashtag, {
    
    # Store user input into reactive object
    store_value$value <- input$hashtag
    
    # Authonitical keys
    consumer_key <- 'PeFZV7nV9QxWs2c6WrfZEjScp'
    consumer_secret <- '07rDxd84GiY4FX6aSwD9yiXTup4uqmhwDFTnJ5EeYo3GQ6A65z'
    access_token <- '1013470531-yLlpr6XA3YSUVuWinURoDrg2njZGkQuU91a5MXp'
    access_secret <- '9EqxPlj2A6D9nXwJDPSzGEvcgcOSxYI7V7DtY67reAklz'
    setup_twitter_oauth(consumer_key,consumer_secret,access_token, access_secret)
    
    # Search and store tweets
    tweets = searchTwitter(store_value$value, n = 200, lang = "en")
    tweets.df = twListToDF(tweets)
    
    # Clean tweets
    tweets.df$text=gsub("&amp", "", tweets.df$text)
    tweets.df$text = gsub("&amp", "", tweets.df$text)
    tweets.df$text = gsub("(RT|via)((?:\\b\\W*@\\w+)+)", "", tweets.df$text)
    tweets.df$text = gsub("@\\w+", "", tweets.df$text)
    tweets.df$text = gsub("[[:punct:]]", "", tweets.df$text)
    tweets.df$text = gsub("[[:digit:]]", "", tweets.df$text)
    tweets.df$text = gsub("http\\w+", "", tweets.df$text)
    tweets.df$text = gsub("[ \t]{2,}", "", tweets.df$text)
    tweets.df$text = gsub("^\\s+|\\s+$", "", tweets.df$text)
    tweets.df$text <- iconv(tweets.df$text, "UTF-8", "ASCII", sub="")
    
    # Emotions for each tweet using NRC dictionary
    emotions <- get_nrc_sentiment(tweets.df$text)
    emo_bar = colSums(emotions)
    emo_sum = data.frame(count=emo_bar, emotion=names(emo_bar))
    emo_sum$emotion = factor(emo_sum$emotion, levels=emo_sum$emotion[order(emo_sum$count, decreasing = TRUE)])
    
    # Generate histogram
    output$plot <- renderPlotly({plot_ly(emo_sum, x=~emotion, y=~count, type="bar", color=~emotion)})
    output$text <- renderText({paste("How do people feel about", input$hashtag, "?")})
    
    # Indicate current time
    output$time <- renderText({invalidateLater(1000, session) 
      paste("Results are generated at: ",Sys.time())})
    
  })
})