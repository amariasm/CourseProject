library(shiny)
shinyServer(function(input,output){
  
   
  #output$oid1 <- renderPrint({input$id1})
 # output$distPlot <- reactivePlot(function() 
  output$distPlot <- renderPlot(function(){
    dist <- rnorm(input$obs,mean=input$m,sd=input$s)
     
    hist(dist,
         main="Histogram of random variables",
         ylab="Frecuency",col="blue",xlab="x")
   
    
    # Generate a summary of the data
    output$summary <- renderPrint({
      summary(dist)
    })
   
    q = input$m + input$s*qnorm(1-input$cl)
    var = abs(q*input$w0)  
    output$var <- renderPrint({var
        
    })
   
    
 
    
  })
})
