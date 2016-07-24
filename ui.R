
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Knitted Baby Hat Pattern Generator"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
        #Select brim style
     radioButtons("units",
                     "Select units:",
                     c("Inches" = "inches",
                       "Cm" = "cm" )),
      radioButtons("brim",
                  "Select brim style:",
                 c("Rolled" = "rolled",
                     "Small Rib (K1 P1)" = "small ribbed",
                     "Medium Rib (K2 P2)" = "medium ribbed",
                     "Large Rib (K4 P4)" = "large ribbed")),
      radioButtons("body",
                   "Select body style:",
                   c("Plain" = "plain",
                     "Striped" = "striped" )),
      radioButtons("top",
                   "Select top style:",
                   c("Plain" = "plain",
                     "I-cord" = "i-cord",
                     "Pom pom" = "pom pom",
                     "Tassle" = "tassle"))
    ),

    # Show a plot of the generated distribution
    mainPanel(
        h4(htmlOutput("title")),
        h4(htmlOutput("reqTitle")),
        htmlOutput("reqs"),
        h4(htmlOutput("gaugeTitle")),
        htmlOutput("gauge"),
        h4(htmlOutput("brimTitle")),
        htmlOutput("start"),
        tags$br(),
        htmlOutput("brim"),
        h4(htmlOutput("bodyTitle")),
        htmlOutput("body"),
        h4(htmlOutput("capTitle")),
        htmlOutput("cap"),
        h4(htmlOutput("topTitle")),
        htmlOutput("top"),
        tags$br(),
        htmlOutput("decoration")
    )
  )
))
