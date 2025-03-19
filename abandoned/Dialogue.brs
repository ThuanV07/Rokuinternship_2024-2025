Function GetUserInput() As String
    screen = CreateObject("roKeyboardScreen")
    port = CreateObject("roMessagePort")
    screen.SetMessagePort(port)
    screen.SetTitle("Enter your name:")
    screen.Show()
    
    while true
        msg = wait(0, port)
        if type(msg) = "roKeyboardScreenEvent" then
            if msg.isScreenClosed() then
                exit while
            else if msg.isButtonPressed() then
                return msg.GetText() ' Capture user input
            end if
        end if
    end while
    return ""
End Function

' Main Execution
name = GetUserInput()
if name <> "" then
    ShowMessageDialog("Confirmation", "Is " + name + " correct?")
else
    ShowMessageDialog("Error", "No name entered!")
end if

Function ShowMessageDialog(dialogTitle, dialogMessage) As Void
    port = CreateObject("roMessagePort")
    dialog = CreateObject("roMessageDialog")
    dialog.SetMessagePort(port)
    dialog.SetTitle(dialogTitle)
    dialog.SetText(dialogMessage)
    dialog.AddButton(1, "[button text]")
    dialog.Show()
    while true
        dlgMsg = wait(0, dialog.GetMessagePort())
        if type(dlgMsg) = "roMessageDialogEvent" then
            if msg.isScreenClosed() then
                exit while
            else if msg.isButtonPressed() then
                ' This assumes you only have one button and you want it
                ' to close the dialog when selected, otherwise check 
                ' msg.GetIndex() and respond appropriately
                dialog.Close()
            end if
        end if
    end while
End Function
