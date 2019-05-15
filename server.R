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
  # Create object for reactive value
  store_value <- reactiveValues(value = character())
  
  # Update when input changes
  observeEvent(input$hashtag, {
    
    # Store user input into reactive object
    store_value$value <- input$hashtag
    
    # When user input is "Game of Throne"
    if (store_value$value == "Game of Thrones") {
      # Authonitical keys
      consumer_key <- 'wU5aIE1E6Mu3JOSkrlWLYiHLP'
      consumer_secret <- 'EajqHPqtlJHbu0MmdS87yfAhL7coU15duID7SDiEVJwL5rt2RR'
      access_token <- '1013470531-rkpR2OP8uSluukdbUBKqoXPWJse9EDwhMl8ggcx'
      access_secret <- 'JViIaEjv64MA6y3xwnWuELsarXDS0QZOKy81VYtrfUe7Q'
      setup_twitter_oauth(consumer_key,consumer_secret,access_token, access_secret)
      
      # Search and store tweets
      tweets = searchTwitter("#gameofthrones", n = 150, lang = "en")
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
      
      # Print text
      output$text <- renderText({paste("How do people feel about the final season of GOT?")})
    }
    
    # When user input is "Avengers: End Game"
    else if (store_value$value == "Avengers: End Game") {
      # Authonitical keys
      consumer_key <- 'wU5aIE1E6Mu3JOSkrlWLYiHLP'
      consumer_secret <- 'EajqHPqtlJHbu0MmdS87yfAhL7coU15duID7SDiEVJwL5rt2RR'
      access_token <- '1013470531-rkpR2OP8uSluukdbUBKqoXPWJse9EDwhMl8ggcx'
      access_secret <- 'JViIaEjv64MA6y3xwnWuELsarXDS0QZOKy81VYtrfUe7Q'
      setup_twitter_oauth(consumer_key,consumer_secret,access_token, access_secret)
      
      # Search and store tweets
      tweets = searchTwitter("#endgame", n = 150, lang = "en")
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
      
      # Print text
      output$text <- renderText({paste("How do people feel about the final Avengers movie?")})
    }
    
    # When user input is "James Charles"
    else if (store_value$value == "James Charles") {
      # Authonitical keys
      consumer_key <- 'wU5aIE1E6Mu3JOSkrlWLYiHLP'
      consumer_secret <- 'EajqHPqtlJHbu0MmdS87yfAhL7coU15duID7SDiEVJwL5rt2RR'
      access_token <- '1013470531-rkpR2OP8uSluukdbUBKqoXPWJse9EDwhMl8ggcx'
      access_secret <- 'JViIaEjv64MA6y3xwnWuELsarXDS0QZOKy81VYtrfUe7Q'
      setup_twitter_oauth(consumer_key,consumer_secret,access_token, access_secret)
      
      # Search and store tweets
      tweets = searchTwitter("#jamescharles", n = 150, lang = "en")
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
      
      # Print text
      output$text <- renderText({paste("How do people feel about the scandalous James Charles?")})
    }
    
    # Generate histogram
    output$plot <- renderPlotly({plot_ly(emo_sum, x=~emotion, y=~count, type="bar", color=~emotion)})
    
    # Indicate current time
    output$time <- renderText({invalidateLater(1000, session) 
      paste("Results are generated at: ",Sys.time())})
    
  })
})