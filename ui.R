library(shiny)

shinyUI(pageWithSidebar(
  
  headerPanel(h3("Generate n- Random variables with a N(mean, sd),
                 Plot the distribution funtion, calculate the Summary and VaR")),
 
  sidebarPanel(  
    h5("Random Variables with:"),
    radioButtons("dist", "Distribution type:",
                 c("Normal" = "norm")),
    h5("Input number of observations:"),  
    sliderInput("obs","Number Observations:", min=1,max=1000,value=500),
  
    h5("Input Mean and Standar Deviation:"),
    sliderInput("m", "Mean:", min=0,max=10, value=0),
    
    sliderInput("s", "Standard Deviation:", min=1,max=10, value=1),
    
    h5("Inputs to calcutate VaR:"),
    numericInput('cl', 'VaR Confidence level', 0.95, min = 0, max = 1),
   
    numericInput('w0', 'Initial Stock', 10000, min = 0, max = 10000),
    h6("*Go to Plot to refresh data"),
    h6("** See documentation, ui.R and Server.R in next project RPresentation")
    
    ),
  

 mainPanel(
   tabsetPanel(type = "tabs", 
               tabPanel("Plot", plotOutput("distPlot")), 
               tabPanel("Summary", verbatimTextOutput("summary")), 
               tabPanel("VaR Result",verbatimTextOutput("var"))
               
            
   )
 
  )
))
