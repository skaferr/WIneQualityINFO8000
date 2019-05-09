library(shiny)
library(caret)

load('rffit.model')
ui<-fluidPage(
  numericInput(inputId="alc","Alcohol(percent vol)",value=9),
  numericInput(inputId="cac","Citric Acid(grams/L)",value=.25),
  numericInput(inputId="vac","Volatile Acidity (grams/L)",value=.5),
  numericInput(inputId="fac","Fixed Acidity(g/L)",value=.2),
  numericInput(inputId="tsulf","Total Sulfur(mg/L)",value=50),
  numericInput(inputId="rs","Residual Sugar(g/L)",value=2),
  numericInput(inputId="ph","pH",value=6),
  numericInput(inputId="chl","Chlorides",value=.1),
  numericInput(inputId="fsulf","Free Sulfur(mg/L)",value=10),
  numericInput(inputId="sulfa","Sulfates(g/L)",value=.6),
  numericInput(inputId="dens","Density",value=1),
  textOutput(outputId = "pred")
)
server <- function(input, output){
  output$pred<-renderText({
    inputs<-data.frame(alcohol=input$alc,citricacid=input$cac,fixedacidity=input$fac,volatileacidity=input$vac,totalsulfurdioxide=input$tsulf,residualsugar=input$rs,pH=input$ph,chlorides=input$chl,freesulfurdioxide=input$fsulf,sulphates=input$sulfa,density=input$dens);
  print((red$quality)[predict(rfFit1,newdata=inputs)])  
  });
}
  
shinyApp(ui=ui,server=server)

