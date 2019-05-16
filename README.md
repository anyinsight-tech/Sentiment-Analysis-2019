# Sentimenta
## Twitter Sentiment Analysis Shiny Web Application
Sentiment Analysis, also known as Opinion Mining, is a field within Natural Language Processing (NLP) that builds systems that try to identify and extract opinions within text. 

By using a “Rule based approach” and creating “polarized lexicons”, our project can analyze tweets to extract subjective data from the public. In our project, we use the NRC dictionary lexicons to screen the emotions. (reference: https://saifmohammad.com/WebPages/NRC-Emotion-Lexicon.htm)

## Purpose
Sentiment analysis is contextual mining of text which identifies and extracts subjective information in source material, and helping a business to understand the social sentiment of their brand, product or service while monitoring online conversations. Sentiment Analysis is applicable in variety of subjects. We can analyse a social sentiment for any product or service, but also in a political purpose. 

### Functions
The user can enter a specific hashtag used for analysis on the side panel. Tweets containing the hashtag are searched and the texts are cleaned to be analyzed. Then, list of words related to the emotions is matched with the tweets and tweets are assigned to an emotion category according to the lexicon. 

### Sentiment Histograms
The histograms demonstrates the sentiments regarding the selected topic. The emotions include postive, negative, anger, disgst, fear, joy, happiness, anticipation, surprise and trust.

![fmmmf](https://user-images.githubusercontent.com/47744782/57874038-f0b8db80-780f-11e9-894f-15bfbd158224.png)

### Word Cloud
The word cloud shows the most used words in the tweets related to the chosen hashtag. It is an effective representation of the attributes and traits of the selected topic. While quantitative results generated in the previous tables are rather ambigious, this qualitative result provides a more in-depth public opinions regarding the selected topic.

![wordcloud](https://user-images.githubusercontent.com/47744782/57873257-fad9da80-780d-11e9-96a7-af07d7dc8e15.png)
