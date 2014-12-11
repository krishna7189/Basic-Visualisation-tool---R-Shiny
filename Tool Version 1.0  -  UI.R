#UI.R
shinyUI(
  navbarPage(p(span("Navigate Bar", style = "color:Green")),
     
             tabPanel("Input Data",
       
              titlePanel(h3("Basic Visualisation Tool Ver 1.0")),
               br(),
               sidebarPanel(style="color:black","Input Data",
                            
                     wellPanel(fileInput('data', 'Choose CSV File',
                                accept=c('text/csv', 'text/comma-separated-values,text/plain', '.csv')),
                               tags$hr(),
                     checkboxInput('header', 'Header', TRUE),
                               tags$hr(),
                     radioButtons('sep', 'Delimeter',
                                  c(Comma=',',
                                    Semicolon=';',
                                    Tab='\t'),
                                  'Semicolon'),
                     radioButtons('quote', 'Quote',
                                  c(None='',
                                    'Double Quote'='"',
                                    'Single Quote'="'"),
                                  'Double Quote'),
                     br(),
                     numericInput("obs", "Number of observations to view:", 5)
                    
                            ),
                width=4
                        ),
               
                      mainPanel(h4("Data Set"),
                                tableOutput("head"),
                                h4("Summary of the Data Set"),
                                tableOutput("Summary"))
            
                       ),
           

        tabPanel("Basic Plots",
                titlePanel("Visual Plots"),
              
                sidebarPanel("Variable Selection",
                
                wellPanel(
                     selectInput("xvar","Choose X-axis Variable:",
                                 choices=c("age","job",
                                           "marital",
                                           "education",
                                           "default",
                                           "balance",
                                           "housing",
                                           "loan",
                                           "contact",
                                           "day","month",
                                           "duration",
                                           "campaign",
                                           "pdays",
                                           "previous",
                                           "poutcome",
                                           "y"),"age"),
                     
                     
                     selectInput("yvar","Choose Y-axis Variable:",
                                 choices=c("age","job",
                                           "marital",
                                           "education",
                                           "default",
                                           "balance",
                                           "housing",
                                           "loan",
                                           "contact",
                                           "day","month",
                                           "duration",
                                           "campaign",
                                           "pdays",
                                           "previous",
                                           "poutcome",
                                           "y"),"marital")
                                                       
                             )),
        
                              
                       mainPanel(
                              tabsetPanel(position ="above",                
                      
                      "Scatter Plots",
                     
                            tabPanel("Scatter Plots", 
                                          h3("Scatter Plots for Continuous X and Y Variables"),
                                           h5("Choose both X and Y Variable for a Scatter Plot"),
                                     
                                                              plotOutput("ScatterPlot")),
                    
                     "Bar Plots",
                             tabPanel("Bar Plot",
                                      h3("Bar Plots for Categorical Variables"),
                                      h5("Choose X variable for genertaing Bar Plot and Y Variable for a Fill"),
                                      plotOutput("barplot")),
                              
                     "Histograms",
                     
              
                             tabPanel("Histogram",
                                           h3("Histograms - Continuos Data"),
                                           h5("Choose only x-Variable"),plotOutput("hist"))
                     
                     
                              )))
                     
        
           ))


 

