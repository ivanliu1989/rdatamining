setwd('C:\\Users\\Ivan.Liuyanfeng\\Desktop\\Data_Mining_Work_Space\\rdatamining')
library(RCurl)
# Set SSL certs globally
options(RCurlOptions = list(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl")))
# API
library(twitteR)
getTwitterOAuth("NP4pbVLgnqvhhSyt4qxhVtgn6", "gZcHVf3ubTQqnlKzg8V6mVGtL3NRiyppZSodKy3mAkp1byaOIQ")

source("http://biostat.jhsph.edu/~jleek/code/twitterMap.R")
twitterMap("RDataMining", fileName="twitterMap.pdf", nMax=1500)

