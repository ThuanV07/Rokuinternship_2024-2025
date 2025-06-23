
' 1st function that runs for the scene component on channel startup
Function init()
  m.questiontitle = m.top.findNode("questiontitle")
  m.buttonGroup = m.top.findNode("buttonGroup")
  m.points = 0
  m.currentIndex = 0
  m.currentAnswer = invalid
  m.content = invalid

  
  ' Create and start the content task
  m.contentTask = CreateObject("roSGNode", "ContentTask")
  m.contentTask.observeField("itemContent", "onContentLoaded")
  m.contentTask.control = "RUN"
  'hard coded list for testing
  m.list = [["thing", ["t", "r", "gg", "ggg"]], ["thing1", ["t1", "r1", "gg1", "ggg1"]], ["thing2", ["t2", "r2", "gg2", "ggg2"]]]
  'initialize the first question
  loadQuestion(m.currentIndex)
  m.buttonGroup.observeField("buttonSelected","onButtonSelected")
end Function

' Handle when content is loaded from the task
sub onContentLoaded()
  'm.content = m.contentTask.itemContent
  'if m.content <> invalid AND m.content.getChildCount() > 0 then
    ' Load first question
  '  loadQuestion(0)
  'else 
  '  ? "Content invalid or no questions found"
  'end if



end sub

' Load a specific question by index
sub loadQuestion(index as Integer)
 ' if m.content <> invalid AND index >= 0 AND index < m.content.getChildCount() then
  '  questionNode = m.content.getChild(index)
    
    ' Update question text and options
    'm.questions.text = questionNode.question
    'm.buttonGroup.buttons = questionNode.options
    
    ' Store current answer for checking
    'm.currentAnswer = questionNode.answer
'  end if

? "Questions successfully loaded"
? m.list[index][0]
  m.questiontitle.text = m.list[index][0]
  m.questiontitle.width = "1000"
  m.questiontitle.height = "400"
  'Initialize buttongroup components
  m.buttonGroup.buttons = m.list[index][1]
  m.buttonGroup.setFocus(true) 'menuing
  
end sub
  

  ' This changes the questions from pressing left or right
sub OnChangingQuestions(key as String, press as Boolean)
  'When moving between different questions, change index left or right       
  if press AND m.content <> invalid then
  '    totalQuestions = m.content.getChildCount()
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
    'Check the answer of the buttons
    if m.buttonGroup.buttonSelected = 0
      checkAnswer(m.buttonGroup.buttonSelected)
    else if m.buttonGroup.buttonSelected = 1
      checkAnswer(m.buttonGroup.buttonSelected)
    else if m.buttonGroup.buttonSelected = 2
      checkAnswer(m.buttonGroup.buttonSelected)
    else if m.buttonGroup.buttonSelected = 3
      checkAnswer(m.buttonGroup.buttonSelected)
    end if
  end if
end sub

' Check if the selected answer is correct
sub checkAnswer(selectedIndex as Integer)
 ' if m.content <> invalid AND m.currentAnswer <> invalid then
 '   selectedOption = m.buttonGroup.buttons[selectedIndex]
  'commented out the error checking for now  
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
