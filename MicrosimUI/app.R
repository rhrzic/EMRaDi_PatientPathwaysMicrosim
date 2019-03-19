#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(tabsetPanel(
  tabPanel("Settings", 
           numericInput(inputId = "n.i", "Population", value = 100),
           numericInput(inputId = "n.t", "Duration (Months)", value = 60),
           
           numericInput(inputId = "p.Diag_Home", "Diagnosis probability at home", value = 0.001, min = 0, max = 1),
           numericInput(inputId = "p.Diag_GP", "Diagnosis probability at GP", value = 0.005, min = 0, max = 1),
           numericInput(inputId = "p.Diag_Hosp", "Diagnosis probability in Hospital", value = 0.01, min = 0, max = 1),
           numericInput(inputId = "p.Diag_UHC", "Diagnosis probability in UHC", value = 0.10, min = 0, max = 1),
           numericInput(inputId = "p.Diag_CBHC", "Diagnosis probability in CBHC", value = 0.20, min = 0, max = 1),
           
           numericInput(inputId = "p.GP_Home", "Referral probability GP - Home", value = 0.60, min = 0, max = 1),
           numericInput(inputId = "p.GP_GP", "Referral probability GP - Home", value = 0, min = 0, max = 1),
           numericInput(inputId = "p.GP_Hosp", "Referral probability GP - Home", value = 0.34, min = 0, max = 1),
           numericInput(inputId = "p.GP_UHC", "Referral probability GP - Home", value = 0.05, min = 0, max = 1),
           numericInput(inputId = "p.GP_CBHC", "Referral probability GP - Home", value = 0.01, min = 0, max = 1),
           
           numericInput(inputId = "p.Hosp_Home", "Referral probability GP - Home", value = 0.001, min = 0, max = 1),
           numericInput(inputId = "p.Hosp_GP", "Referral probability GP - Home", value = 0.001, min = 0, max = 1),
           numericInput(inputId = "p.Hosp_Hosp", "Referral probability GP - Home", value = 0.001, min = 0, max = 1),
           numericInput(inputId = "p.Hosp_UHC", "Referral probability GP - Home", value = 0.001, min = 0, max = 1),
           numericInput(inputId = "p.Hosp_CBHC", "Referral probability GP - Home", value = 0.001, min = 0, max = 1),
           
           numericInput(inputId = "p.UHC_Home", "Referral probability GP - Home", value = 0.001, min = 0, max = 1),
           numericInput(inputId = "p.UHC_GP", "Referral probability GP - Home", value = 0.001, min = 0, max = 1),
           numericInput(inputId = "p.UHC_Hosp", "Referral probability GP - Home", value = 0.001, min = 0, max = 1),
           numericInput(inputId = "p.UHC_UHC", "Referral probability GP - Home", value = 0.001, min = 0, max = 1),
           numericInput(inputId = "p.UHC_CBHC", "Referral probability GP - Home", value = 0.001, min = 0, max = 1),
           
           numericInput(inputId = "c.Home", "Cost healthcare utilization - Home", value = 0.001, min = 0, max = 1),
           numericInput(inputId = "c.GP", "Cost healthcare utilization - GP", value = 0.001, min = 0, max = 1),
           numericInput(inputId = "c.Hosp", "Cost healthcare utilization - Hospital", value = 0.001, min = 0, max = 1),
           numericInput(inputId = "c.UHC", "Cost healthcare utilization - UHC", value = 0.001, min = 0, max = 1),
           numericInput(inputId = "c.CBHC", "Cost healthcare utilization - CBHC", value = 0.001, min = 0, max = 1),

           numericInput(inputId = "u.Diag", "Utility increase of diagnosis", value = 0.001, min = 0, max = 1),
           
           actionButton("go", "")
  ),
  tabPanel("Results table", tableOutput(ResultsTable))
))

# Define server logic required to draw a histogram
server <- function(input, output) {
   
   output$distPlot <- renderPlot({
      # generate bins based on input$bins from ui.R
      x    <- faithful[, 2] 
      bins <- seq(min(x), max(x), length.out = input$bins + 1)
      
      # draw the histogram with the specified number of bins
      hist(x, breaks = bins, col = 'darkgray', border = 'white')
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

