#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(gapminder)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Gapminder Data"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            checkboxGroupInput("continent",
                               label = "Choose which Continent",
                               choices = unique(gapminder$continent),
                               selected = c("Asia", "Europe"),
                
            ),
            
            sliderInput("years",
                        "Select years",
                        min = min(gapminder$year),
                        max = max(gapminder$year),
                        value = c(1952, 2007),
                        step = 1,
                        round = TRUE),
            
            selectInput("country",
                        label = "Select Country for Comparison",
                        choices = (unique(gapminder$country)),
                        selected = "France"),
            ),

        # Show a plot of the generated distribution
        mainPanel("Life Expactancy and GDP Analysis",
           plotOutput("scatterPlot"),
           textOutput("maxExpactancy"),
           plotOutput("lineGraph"),
           
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$scatterPlot <- renderPlot({
        cont <- input$continent
        dat <- subset(gapminder, gapminder$continent %in% cont)
        
        p <- ggplot(
            dat,
            aes(x = gdpPercap, y = lifeExp, size = pop, colour = continent)
        ) +
            geom_point(show.legend = TRUE, alpha = 0.7) +
            scale_color_viridis_d() +
            scale_size(range = c(2, 12)) +
            scale_x_log10() +
            labs(x = "GDP per capita", y = "Life expectancy")
        p
    })
    
    
    
    output$lineGraph <- renderPlot({
        p <- ggplot(gapminder,
                    aes(year, lifeExp, group = country, color = continent)) +
            geom_line() +
            labs(x = "Year", y = "Life Expectancy")
        p
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
