sub init()
  m.textBox = m.top.findNode("textBox")
  m.textBox.observeField("text", "onTextChanged")
  m.submitButton = m.top.findNode("submitButton")

  ' Set up button click observer
  m.submitButton.observeField("buttonSelected", "onSubmit")
end sub

sub onTextChanged()
  print "You typed: "; m.textBox.text
end sub

sub onSubmit()
  name = m.textBox.text
end sub
