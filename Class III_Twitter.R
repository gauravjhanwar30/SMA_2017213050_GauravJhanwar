#Install package 'twitteR'

ConsumerKey = 'wjtrvHvEohqqYHW9EAbtjml3J'
ConsumerSecret = '6WwX6GhQkptYsLlLoK8DflW16pTzPcxwcsNA4ViX703f1RSKaF'
OauthToken = '419502821-muPWtOBZGF8Q9eAppvM008OqoIlOvIxmeKC8CbxV'
OauthaSecret = 'N0xbKk9HpqdqaBTI1px9prhVEIWjGqbYGphMC2u5bbDw2'

#Setup twitter connection
library(twitteR)
setup_twitter_oauth(ConsumerKey, ConsumerSecret, OauthToken, OauthaSecret)

#Get muy user object
myUser = getUser("@BeingSalmanKhan")
myUser$getScreenName()
myUser$getFriends()


library(twitteR)
library(ggplot2)
library(maps)
library(stringr)

availableTrendLocations()
getTrends(2282863)

#twListToDF() function uses for sentiment analysis.

tweets = searchTwitter("elections", n=1000, geocode = "77.12,28.64,2000km", retryOnRateLimit = 200)
tweetsDF2 = twListToDF(tweets)
head(tweetsDF2)

tweetsDF2$longitude = as.numeric(tweetsDF2$longitude)
tweetsDF2$latitude = as.numeric(tweetsDF2$latitude)

library(maps)
#plots worldmap


#Assignment:
#Network, Text, Location, Action
#R blogger
#Stack exchange