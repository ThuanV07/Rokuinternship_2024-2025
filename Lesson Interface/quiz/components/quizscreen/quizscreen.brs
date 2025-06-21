
' 1st function that runs for the scene component on channel startup
Function init()
  m.questions = m.top.findNode("questiontitle")
  m.buttonGroup = m.top.findNode("buttonGroup")
  m.top.setFocus = true
  m.points = 0
  m.currentIndex = 0
  m.currentAnswer = invalid
  m.content = invalid
  m.buttonGroup.setFocus(true) 'menuing
  m.buttonGroup.observeField("buttonSelected","onButtonSelected")
  
  ' Create and start the content task
  m.contentTask = CreateObject("roSGNode", "ContentTask")
  m.contentTask.observeField("itemContent", "onContentLoaded")
  m.contentTask.control = "RUN"

  
end Function

' Handle when content is loaded from the task
sub onContentLoaded()
  m.content = m.contentTask.itemContent
  if m.content <> invalid AND m.content.getChildCount() > 0 then
    ' Load first question
    loadQuestion(0)
  else 
    ? "Content invalid or no questions found"
  end if

end sub

' Load a specific question by index
sub loadQuestion(index as Integer)
  if m.content <> invalid AND index >= 0 AND index < m.content.getChildCount() then
    m.currentIndex = index
    questionNode = m.content.getChild(index)
    
    ' Update question text and options
    m.questions.text = questionNode.question
    m.buttonGroup.buttons = questionNode.options
    
    ' Store current answer for checking
    m.currentAnswer = questionNode.answer
  end if
  m.questions.text = m.jsonInfo[0][0]
  m.buttongroup.buttons = m.jsonInfo[0][1]
  m.buttongroup.width = 500
  m.buttongroup.height = 1000
  ? m.jsonInfo[0][0]
end sub
  

  ' This changes the questions from pressing left or right
sub OnChangingQuestions(key as String, press as Boolean)
  'When moving between different questions, change index left or right       
  if press AND m.content <> invalid then
      totalQuestions = m.content.getChildCount()
      if key = "right" AND m.currentIndex < (totalQuestions - 1) then
        m.currentIndex = m.currentIndex + 1
        loadQuestion(m.currentIndex)
      else if key = "left" AND m.currentIndex > 0 then
        m.currentIndex = m.currentIndex - 1
        loadQuestion(m.currentIndex)
      end if
    end if

end sub

' Handle button selection
sub onButtonSelected()
  if m.buttonGroup.buttonSelected <> invalid then
    ' Check if answer is correct based on your data structure
    ' You may need to adjust this based on your JSON structure
    checkAnswer(m.buttonGroup.buttonSelected)
  end if
end sub

' Check if the selected answer is correct
sub checkAnswer(selectedIndex as Integer)
  if m.content <> invalid AND m.currentAnswer <> invalid then
    questionNode = m.content.getChild(m.currentIndex)
    selectedOption = questionNode.options[selectedIndex]
    
    if selectedOption = m.currentAnswer then
      m.points = m.points + 1
      ? "Correct! Points: " + str(m.points)
      ' Update points display
      pointsLabel = m.top.findNode("pointslabel")
      if pointsLabel <> invalid then
        pointsLabel.text = "Points: " + str(m.points)
      end if
    else
      ? "Incorrect answer. Correct answer was: " + m.currentAnswer
    end if
  end if
end sub
