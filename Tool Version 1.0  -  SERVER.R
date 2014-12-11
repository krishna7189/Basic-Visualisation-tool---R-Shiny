#SERVER.R

library(shiny)
library(ggplot2)

shinyServer(function(input, output) 
  {
  InputData <- reactive({inFile <- input$data
                       if (is.null(inFile))
                        return(NULL)
                  read.csv(inFile$datapath, header=input$header, sep=input$sep, quote=input$quote,stringsAsFactors=FALSE)
                      })
  
  
  output$names <- renderUI({     selectInput("Variables","chooseVariable:",choices=colnames(InputData()))
                     })
 
  
  
  output$head <- renderTable({      head(InputData(),n=input$obs
                              )})
  
  
  
  output$Summary<-renderTable({
   if (is.null(InputData()))
      return(NULL)
    summary(InputData())
    })
  
  
  
  
  output$barplot<-renderPlot({ 
  if (is.null(InputData()))
    return(NULL)
      ggplot(InputData(), aes_string(x=input$xvar,fill=input$yvar)) +
      geom_bar(width=0.5,colour="darkblue")
   
 }) 
    
 output$hist<-renderPlot({
   if (is.null(InputData()))
     return(NULL)
     ggplot(InputData(), aes_string(x=input$xvar)) +
     geom_histogram(width=0.5,fill="yellow",colour="darkred")
 
 }) 

 output$ScatterPlot <- renderPlot({
   if (is.null(InputData()))
     return(NULL)
   ggplot(InputData(), aes_string(x=input$xvar, y=input$yvar)) + geom_point()
  
 })
 
 
})
