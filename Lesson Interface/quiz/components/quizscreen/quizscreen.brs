
' 1st function that runs for the scene component on channel startup
Function init()
  m.questiontitle = m.top.findNode("questiontitle")
  m.buttonGroup = m.top.findNode("buttonGroup")
  m.nextbutton = m.top.findNode("nextbutton")
  m.backbutton = m.top.findNode("backbutton")
  m.exitbutton = m.top.findNode("exitbutton")
  m.answerprogress = m.top.findNode("answerprogress")
  m.pointslabel = m.top.findNode("pointslabel")
  m.points = 0
  m.currentIndex = 0
  'when changing between different options
  m.selectedIndex = 0

  
  ' Create and start the content task
  m.contentTask = CreateObject("roSGNode", "ContentTask")
  m.contentTask.observeField("itemContent", "onContentLoaded")
  m.contentTask.control = "RUN"
  'hard coded list for testing
  m.list = [["thing", ["t", "r", "gg", "ggg"], "gg", false], ["thing1", ["t1", "r1", "gg1", "ggg1"], "ggg1", false], ["thing2", ["t2", "r2", "gg2", "ggg2"], "r2", false ]]
  'initialize the first question
  loadQuestion(m.currentIndex)
  m.answerprogress.text = str(m.currentIndex + 1) + "/" + str(m.list.count())

  m.buttonGroup.observeField("buttonSelected","onChoiceSelected")
  m.nextbutton.observeField("buttonSelected","changeQuestions")
  m.backbutton.observeField("buttonSelected","changeQuestions")

end Function

' Load a specific question by index
sub loadQuestion(index as Integer)

? "Question successfully loaded"
  m.selectedIndex = 0
  'initialize questiontitle
  
  m.questiontitle.text = m.list[index][0]
  m.questiontitle.width = "1000"
  m.questiontitle.height = "400"
  'Initialize the answerchoices
  m.buttonGroup.buttons = m.list[index][1]
  m.currentAnswer = m.list[index][2]
  m.buttonGroup.setFocus(true) 'menuing
  button = m.buttonGroup.getChild(0)
  button.setFocus(true)

  
end sub
  

  ' Handle key presses for navigation
function onKeyEvent(key, press) as Boolean
  'When moving between different questions, change index left or right       

      ' When the buttongroup is selected and you want to move to the next or back button
      if m.buttonGroup.setfocus(true)
        if key = "right"
          'set the focus to the next button to true
          m.nextbutton.setfocus(true)
          ? "eeeeeeeeeee" 'debug print
        else if key = "left"
          'set the focus to the back button to true
          m.backbutton.setfocus(true)
          ? "fire"
        else if key = "down" AND m.selectedIndex < m.buttonGroup.buttons.count() - 1
          m.selectedIndex = m.selectedIndex + 1
          ? "down index: " + str(m.selectedIndex)
        else if key = "up" AND m.selectedIndex > 0
          m.selectedIndex = m.selectedIndex - 1 
          ? "up index: " + str(m.selectedIndex)
        else if key = "back"
          m.exitbutton.setfocus(true)
      end if
      return true
    end if



  end function

' Handle button selection
sub onChoiceSelected()
  'if m.buttonGroup.buttonSelected <> invalid then
    'Check the answer of the buttons
    if m.buttonGroup.buttonSelected = 0 or 1 or 2 or 3
      checkAnswer()  
    end if
 ' end if
end sub

function changeQuestions()
  if m.nextbutton.hasfocus() AND m.currentIndex < m.list.count() - 1
    m.currentIndex = m.currentIndex + 1
    loadQuestion(m.currentIndex mod m.list.count())
    

  else if m.backbutton.hasfocus() AND m.currentIndex > 0
    m.currentIndex = m.currentIndex - 1
    loadQuestion((m.currentIndex + m.list.count()) mod m.list.count())
  end if
m.answerprogress.text = str(m.currentIndex + 1) + " / " + str(m.list.count())

end function  
' Check if the selected answer is correct
sub checkAnswer()

 ' if m.content <> invalid AND m.currentAnswer <> invalid then
    selectedOption = m.buttonGroup.buttons[m.selectedIndex]
    ? m.buttonGroup.buttons[m.selectedIndex]

  'commented out the error checking for now  
    if selectedOption = m.currentAnswer  and m.list[m.currentIndex][3] = false

      m.list[m.currentIndex][3] = true ' Mark question as answered
      
      m.points = m.points + 1
      m.pointslabel.text = "Points: " + str(m.points)
      
    '  ? "Correct! Points: " + str(m.points)
      ' Update points display
   '   pointsLabel = m.top.findNode("pointslabel")
      ? "Correct Answer"
    else
      ? "Incorrect answer. Correct answer was: " + m.currentAnswer
    end if
  
end sub
