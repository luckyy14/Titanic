library(rsconnect)
library(shiny)
setwd("C:\Users\laksh\OneDrive\Desktop\Titanic")
shiny.deprecation.messages=FALSE

rsconnect::setAccountInfo(name='cyberalien',token='9BC16A69AEE8F48A5ED08E0C621C75A1',secret='94Nee1OyCtGDhhoCq6cTFwXMAeXUO5kydM+do9Rj')
#runGitHub( "Titanic", "luckyy14")
runApp()
