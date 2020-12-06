
##we transferred all of the parameters above into the UI syntax

library(shiny)
# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Global Average Temperature Anomalies from 1880 to 2016"),
  
  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      
      sliderInput("currentYear","Select Year",
                  min=1880,max=2016,value=1880, sep="",animate=TRUE)
      
      
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      
      plotOutput("linePlot",height="300px"),
      br(),
      plotOutput("columnPlot",height="100px"),
      
      p(strong("Description:"), "This application aims to simulate an interactive climate change visualization
        from ", a ("Bloomberg.", href = "https://www.bloomberg.com/graphics/hottest-year-on-record/"), 
        "This visualization displays the global temperature anomalies in Celsius for every month from 1880 to 2016
        with a line plot and bar plot. Gradations of red and blue represent positive and negative annual 
        mean temperature anomalies, respectively. A bolded line indicates the mean temperature anomaly for 
        the selected year. A horizontal dashed line represents the record-holding mean temperature anomaly 
        year in the range of years selected."),
      
      p(strong("Authors:"), "Andrew Bridglall, Ariel Calver, Nikhil Wadhwa, Sean Melville")
      
      
    )
  )
))
