#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#


# Define UI for application that draws a histogram
fluidPage(
  
  # Application title
  titlePanel("Penguin Data"),
  
  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      width = 3,
      selectInput('histVariable', 
                  'Select a Histogram Variable',
                  choices = numeric_variables
      ),
      sliderInput("bins",
                  "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30
      ), 
      selectInput('island',
                  label = 'Select an Island', 
                  choices = c('All', penguins |> distinct(island) |> pull(island) |> sort()), 
                  selected = 1)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      width = 9,
      fluidRow(
        column(
          width = 6,
          plotOutput("distPlot") 
        ), 
        column(
          width = 6,
          plotOutput('speciesCountPlot')  
        )
      ), 
      fluidRow(
        dataTableOutput('selectedDataTable')
      )
    )
  )
)
