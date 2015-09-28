
# Define server logic required to summarize and view the 
# selected dataset
shinyServer(function(input, output) {
  
  # Return the requested dataset
  #datasetInput <- reactive({
  #  switch(input$dataset,
  #         "rock" = rock,
  #         "pressure" = pressure,
  #         "cars" = cars)
  #})
  
  # Generate a summary of the dataset
  output$summary <- renderPrint({
    
    input$generate
    
    analysisStep1 <<- partialMatrix49FN(chooseBall49FN(c(2,3,4,5)))
    analysisStep2 <<- recommendMatrix49FN(recommendMatrix = analysisStep1 )
    analysisStepResult <<- recommendResultFN49(recommendResult = analysisStep2,score=105)
    historyRecord <<- compareResultFN49(as.numeric(levels(analysisStepResult[,1])))
    
    cat("此組合 ", paste(analysisStepResult[,1],collapse=",")," 在歷史上一共中過", length(historyRecord),"次",sep="")
    
  })
  
  #historyRecord <- compareResultFN49(examineResult = as.numeric(levels(finalResult[,1])
  #temp3_1 <- partialMatrix49FN(chooseBall49FN(c(2,3,4,5)))
  #temp3_2 <- recommendMatrix49FN(recommendMatrix = temp3_1 )
  #finalResult <- recommendResultFN49(recommendResult = temp3_2,score=105)
  #temp3_4 <- historyRecordFN49(examineResult = temp3_3[,1])
  #temp3_5 <- historyRecordCombo3FN49(examineResult = temp3_3[,1],historyRecord = temp3_4 )
  # <- historyBest3FN49(examineResult = as.numeric(levels(temp3_3[,1])) )

  
  output$historyCombin <- renderPrint({
    
    input$generate
    
    cat(paste(analysisStepResult[,1],collapse=","))
  })
  
  
  # Show the first "n" observations
  output$view <- renderTable({
    
    input$generate
    
    
    originData[historyRecord,c(1,3:9)]
  })
})