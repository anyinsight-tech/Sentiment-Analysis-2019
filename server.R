# Load the required Packages
library(shiny)
library(twitteR)
library(RCurl)
library(httr)
library(tm)
library(wordcloud)
library(syuzhet)
library(plotly)

shinyServer(function(input, output, session) {
  # Create reactive object
  store_value <- reactiveValues(value = character())
  
  # Update when input changes
  observeEvent(input$hashtag, {
    
    # Store user input into reactive object
    store_value$value <- input$hashtag
    
    # When user input is "Brexit"
    if (store_value$value == "Brexit") {
      # Authonitical keys
      consumer_key <- 'wU5aIE1E6Mu3JOSkrlWLYiHLP'
      consumer_secret <- 'EajqHPqtlJHbu0MmdS87yfAhL7coU15duID7SDiEVJwL5rt2RR'
      access_token <- '1013470531-rkpR2OP8uSluukdbUBKqoXPWJse9EDwhMl8ggcx'
      access_secret <- 'JViIaEjv64MA6y3xwnWuELsarXDS0QZOKy81VYtrfUe7Q'
      setup_twitter_oauth(consumer_key,consumer_secret,access_token, access_secret)
      
      # Search and store tweets
      tweets = searchTwitter("#brexit", n = 200, lang = "en")
      tweets.df = twListToDF(tweets)
      
      # Remove characters that are not english words
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
      
      # Sentiment analysis using NRC dictionary
      emotions <- get_nrc_sentiment(tweets.df$text)
      emo_bar = colSums(emotions)
      emo_sum = data.frame(count=emo_bar, emotion=names(emo_bar))
      emo_sum$emotion = factor(emo_sum$emotion, levels=emo_sum$emotion[order(emo_sum$count, decreasing = TRUE)])
      
      # Print text
      output$text <- renderText({paste("How do people feel about brexit?")})
    }
    
    # When user input is "Samsung fold"
    else if (store_value$value == "Samsung fold") {
      # Authonitical keys
      consumer_key <- 'wU5aIE1E6Mu3JOSkrlWLYiHLP'
      consumer_secret <- 'EajqHPqtlJHbu0MmdS87yfAhL7coU15duID7SDiEVJwL5rt2RR'
      access_token <- '1013470531-rkpR2OP8uSluukdbUBKqoXPWJse9EDwhMl8ggcx'
      access_secret <- 'JViIaEjv64MA6y3xwnWuELsarXDS0QZOKy81VYtrfUe7Q'
      setup_twitter_oauth(consumer_key,consumer_secret,access_token, access_secret)
      
      # Search and store tweets
      tweets = searchTwitter("#samsungfold", n = 200, lang = "en")
      tweets.df = twListToDF(tweets)
      
      # Remove characters that are not english words
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
      
      # Sentiment analysis using NRC dictionary
      emotions <- get_nrc_sentiment(tweets.df$text)
      emo_bar = colSums(emotions)
      emo_sum = data.frame(count=emo_bar, emotion=names(emo_bar))
      emo_sum$emotion = factor(emo_sum$emotion, levels=emo_sum$emotion[order(emo_sum$count, decreasing = TRUE)])
      
      # Print text
      output$text <- renderText({paste("How do people feel about the new product Samsung fold?")})
    }
    
    # When user input is "Credit Suisse"
    else if (store_value$value == "Credit Suisse") {
      # Authonitical keys
      consumer_key <- 'wU5aIE1E6Mu3JOSkrlWLYiHLP'
      consumer_secret <- 'EajqHPqtlJHbu0MmdS87yfAhL7coU15duID7SDiEVJwL5rt2RR'
      access_token <- '1013470531-rkpR2OP8uSluukdbUBKqoXPWJse9EDwhMl8ggcx'
      access_secret <- 'JViIaEjv64MA6y3xwnWuELsarXDS0QZOKy81VYtrfUe7Q'
      setup_twitter_oauth(consumer_key,consumer_secret,access_token, access_secret)
      
      # Search and store tweets
      tweets = searchTwitter("#creditsuisse", n = 200, lang = "en")
      tweets.df = twListToDF(tweets)
      
      # Remove characters that are not english words
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
      
      # Sentiment analysis using NRC dictionary
      emotions <- get_nrc_sentiment(tweets.df$text)
      emo_bar = colSums(emotions)
      emo_sum = data.frame(count=emo_bar, emotion=names(emo_bar))
      emo_sum$emotion = factor(emo_sum$emotion, levels=emo_sum$emotion[order(emo_sum$count, decreasing = TRUE)])
      
      # Print text
      output$text <- renderText({paste("How do people feel about Credit Suisse?")})
    }
    
    # Generate histogram
    output$plot <- renderPlotly({plot_ly(emo_sum, x=~emotion, y=~count, type="bar", color=~emotion)})
    
    # Indicate current time
    output$time <- renderText({invalidateLater(1000, session) 
      paste("Results are generated at: ",Sys.time())})
    
  })
})