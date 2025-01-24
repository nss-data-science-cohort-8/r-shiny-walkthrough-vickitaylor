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

    plot_data <- reactive({
      plot_data <- animals
      
      if(input$type != 'All'){
        plot_data <- plot_data |>
          filter(Type == input$type)
      }
      return(plot_data)
    })
    
  
    output$distPlot <- renderPlot({
      
      plot_data() |> 
        ggplot(aes(x = `Days in Shelter`)) +
          geom_histogram(bins = input$bins, 
                         fill = 'lightblue') +
          labs(title = 'Days Animals in the Shelter', x = 'Days in Shelter')
    })

    output$returnChart <- renderPlot({
      plot_data() |>
        group_by(`Outcome Type`) |> 
        summarize(n = n()) |> 
        ggplot(aes(x = `Outcome Type`, y = n)) +
        geom_col(fill = 'lightpink') +
        labs(
          title = 'Outcome Types', 
          y = 'count'
        )
    })
    
    output$outcomeTable <- renderDataTable({
      datatable(
        plot_data()
      )
    })
    

    
}




