#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#



# Define server logic required to draw a histogram
function(input, output, session) {

    output$distPlot <- renderPlot({
      
      plot_data <- animals
      
      # need to add outcome to the filter 
      
      if(input$type != 'All'){
        plot_data <- plot_data |> 
          filter(Type == input$type)
      }
      
      plot_data |> 
        ggplot(aes(x = `Days in Shelter`)) +
          geom_histogram(bins = input$bins) +
          labs(title = 'Days Animals in the Shelter', x = 'Days in Shelter')
    })

}
