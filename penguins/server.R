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
      
      plot_data <- penguins
      
      if(input$island != 'All'){
        plot_data <- plot_data |> 
          filter(island == input$island) 
      }
      
      title <- glue("Distribution of Body Mass for {input$island} Island")
      
      plot_data |> 
        ggplot(aes(x=body_mass_g)) +
        geom_histogram(bins = input$bins) +
        labs(title = title, x = 'Body Mass (g)')
    })

}

