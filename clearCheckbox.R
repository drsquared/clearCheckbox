library(shiny)
ui <- fluidPage(
  wellPanel(checkboxGroupInput("dbr", selected = NULL,
                               h4("Select Data Breach Rating"),
                               c("Low" = "Low",
                                 "Medium" = "Medium",
                                 "High" = "High",
                                 "Critical" = "Critical")),
            actionButton("reset_artifact_entry", label = "Reset")
  )
)

server <- function(input, output, session) {
  # Rest button for artifact entry page
  observeEvent(input$reset_artifact_entry, {
    updateCheckboxGroupInput(session, "dbr", choices = c(
      "Low" = "Low",
      "Medium" = "Medium",
      "High" = "High",
      "Critical" = "Critical"), selected = NULL)
    print(getwd())
    write.csv(1, "test.csv")  
  })
}
shinyApp(ui, server)
