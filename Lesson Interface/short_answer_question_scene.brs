sub init()
  m.textBox = m.top.findNode("textBox")
  m.textBox.observeField("text", "onTextChanged")
end sub

sub onTextChanged()
  print "You typed: "; m.textBox.text
end sub
