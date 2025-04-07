sub init()
  m.textBox = m.top.findNode("textBox")
  m.submitButton = m.top.findNode("submitButton")

  ' Set up button click observer
  m.submitButton.observeField("buttonSelected", "onSubmit")
  m.submitButton.observeField("buttonSelected", "onSubmit")
  m.textBox.observeField("text", "onTextChanged")
end sub

sub onTextChanged()
  print "You typed: "; m.textBox.text
end sub

sub onSubmit()
  name = m.textBox.text
end sub
