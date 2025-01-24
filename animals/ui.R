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
  titlePanel("Shelter Animal Outcomes"),
  
  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
    width = 3, 
      sliderInput("bins",
                  "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30), 
      selectInput('type', 
                  'Animal Type', 
                  choices = c('All', animals |> distinct(Type) |> pull(Type) |> sort()), 
                  selected = 1)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      tabsetPanel(
        tabPanel('Plot', plotOutput("distPlot")),
        tabPanel('Chart', plotOutput('returnChart')), 
        tabPanel('Table', dataTableOutput('outcomeTable'))
      )
    )
  )
)







