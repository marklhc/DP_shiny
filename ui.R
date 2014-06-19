library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Effect Size Calculation"),
  sidebarPanel(
    numericInput('N1', 'sample size 1 (experimental)', 30, min = 1, step = 1),
    numericInput('N2', 'sample size 1 (control)', 30, min = 1, step = 1),
    numericInput('mean1', 'mean 1 (experimental)', 0, min = 0, step = 1),
    numericInput('mean2', 'mean 2 (control)', 0, min = 0, step = 1),
    numericInput('sd1', 'standard deviation 1 (experimental)', 1, min = 0.0001, step = 1),
    numericInput('sd2', 'standard deviation 2 (control)', 1, min = 0.0001, step = 1),
    submitButton('Submit')
  ),
  mainPanel(
    h2("This app computes Cohen's d and Hedges's g for two-group experimental
        studies based on input of sample sizes, means, and standard deviations"),
    h3("Cohen's d"),
    verbatimTextOutput("cohen.d"),
    h3("Hedges's g"),
    verbatimTextOutput("hedges.g")
  )
))