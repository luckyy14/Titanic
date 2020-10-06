#ui.R
library(shiny)
library(ggplot2)

trainData <- read.csv("./data/train.csv")

dataset <- trainData


shinyUI(fluidPage(
	navbarPage("Data Analytics course"
		# navbarMenu("Links ",
  #   		tabPanel$a(href = "https://www.kaggle.com/c/titanic-gettingStarted", "Kaggle Titanic Challenge"),
  #   		tabPanel("Table")
  #   	)
	),
	titlePanel("Titanic"),
	sidebarLayout(
	 sidebarPanel(
		
		h3('Tweek the Plot'),

		sliderInput('sampleSize', 'Choose Sample Size', min=1, max=nrow(dataset),
				value=min(500, nrow(dataset)), step=100, round=0),
		selectInput('x', 'X', names(dataset), selected = "Age"),
		selectInput('y', 'Y', names(dataset), selected = "Pclass"),
		selectInput('color', 'Color', selected = "Sex" , c('None', names(dataset))),

		checkboxInput('jitter', 'Jitter'),
		checkboxInput('smooth', 'Smooth'),

    	selectInput('facet_row', 'Facet Row', selected = "Survived", c(None='.', names(dataset))),
    	selectInput('facet_col', 'Facet Column', c(None='.', names(dataset))),
    	downloadButton('downloadData', 'Download Train set'),
    	tags$br(),
    	tags$br(),
    	strong('VARIABLE DESCRIPTIONS:'),
    	tags$ul(
    		tags$li('survival - Survival (0 = No; 1 = Yes)'),
    		tags$li('pclass - Passenger Class (1 = 1st; 2 = 2nd; 3 = 3rd)'),
    		tags$li('name - Name'),
            tags$li('sex - Sex'),
            tags$li('age - Age'),
            tags$li('sibsp - Number of Siblings/Spouses Aboard'),
            tags$li('parch - Number of Parents/Children Aboard'),
            tags$li('ticket - Ticket Number'),
            tags$li('fare - Passenger Fare'),
            tags$li('cabin - Cabin'),    
            tags$li('embarked - Port of Embarkation (C = Cherbourg; Q = Queenstown; S = Southampton)'),
            tags$li('cabin - Cabin'), 
            tags$li('cabin - Cabin')
            ),  
	 mainPanel(
		h2('Basic Introductory Exploratory Analysis'),
		plotOutput('plot'),
		tags$br(),
		h4('Training Dataset'),
		p(' raw dataset'),
		tags$br(),
		tabPanel('trainData', dataTableOutput('mytable1'))
				
	 )
	)
))