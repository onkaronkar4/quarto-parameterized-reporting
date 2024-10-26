
# Let’s make a plot of how the life expectancy has changed in Asia over time. We start by filtering the data:

library(tidyverse)
library(gapminder)

gapminder_asia <- gapminder |>
  filter(continent == "Asia")
# We then make a plot:
ggplot(data = gapminder_asia) + 
  geom_boxplot(
    mapping = aes( x = factor(year), y = lifeExp)
  ) + 
  labs(
    x = NULL, 
    y = "Life Expectancy (years)", 
    title =  "Life Expectancy in Asia"
  )

# If we wanted to create the same plot but for Europe, what would we need to change?
  
# 1. The value that the data is filtered on
# 2. The text in the title

# Let's create a variable for the continent 
choose_continent <- "Asia"

# Then use that value in our code 

gapminder_asia <- gapminder |>
  filter(continent == choose_continent)
# We then make a plot:
ggplot(data = gapminder_asia) + 
  geom_boxplot(
    mapping = aes( x = factor(year), y = lifeExp)
  ) + 
  labs(
    x = NULL, 
    y = "Life Expectancy (years)", 
    title =  glue("Life Expectancy in {choose_continent}")
  )

# This makes it easier to turn it into function

continent_plot <- function(choose_continent, data = gapminder) {
  # Filter data
  gapminder_continent <- data |>
    filter(continent == choose_continent)
  # Plot
  g <- ggplot(data = gapminder_continent) +
    geom_boxplot(
      mapping = aes(x = factor(year), y = lifeExp)
    ) +
    labs(
      x = NULL, y = "Life Expectancy (years)",
      title = glue::glue("Life Expectancy in {choose_continent}")
    )
  return(g)
}

# Check it works

continent_plot("Europe")

continent_plot("Africa")



