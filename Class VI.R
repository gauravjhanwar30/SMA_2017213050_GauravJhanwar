library(tidyverse)
library(leaflet)

devtools::install_github("flovv/RoogleVision")
library(RoogleVision)
library(jsonlite)
source("http://bioconductor.org/biocLite.R")
biocLite("EBImage")
library(EBImage)

#Google Cloud
c=fromJSON(file.choose())
options("googleAuthR.client_id"=c$installed$client_id)
options("googleAuthR.client_secret"=c$installed$client_secret)
options("googleAuthR.scopes.selected"=c("https://www.googleapis.com/auth/cloud-platform"))
googleAuthR::gar_auth()
