#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(circlize)
library(ggplot2)
library(tidyr)
library(dplyr)
library(reshape2)

num1 <- c(11381,10182,119134,85394,7199,0,1010,24737,17355,1762)
df1 <- matrix(num1, ncol=2)
rownames(df1) <- c('iPad','iPhone','Windows','Macintosh','X11')
colnames(df1) <- c('0','1')

num <- c(40899,125030,13566,53895,11381,14847,20561,1781,7675,0)
df <- matrix(num, ncol=2)
rownames(df) <- c('Firefox','Chrome','IE','Safari','iPad')
colnames(df) <- c('0','1')

# Define UI for application that draws a histogram
ui <- fluidPage(
    fluidRow(
        titlePanel("userBrowser & Platform Distribution")
    ),
    
    fluidRow(
        column(5, 
               h3("Retention/loss distribution of users using different Platform"),
               plotOutput("VIS1")),
        column(5,
               h3("Retention/loss distribution of users using different userBrowser"),
               plotOutput("VIS2"))
    )
    
)
# Define server logic required to draw a chord diagram
#server


server <- function(input, output) {
    output$VIS1 <- renderPlot({
        df1 %>% chordDiagram(transparency = 0.6,annotationTrack=c("name","grid","axis"), annotationTrackHeight = c(0.09, 0.06))
    }
    
    )
    output$VIS2 <- renderPlot({
        df %>% chordDiagram(transparency = 0.6,annotationTrack=c("name","grid","axis"), annotationTrackHeight = c(0.09, 0.06))
    })
    
    
}


# Run the application 
shinyApp(ui = ui, server = server)
