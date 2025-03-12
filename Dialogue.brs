name = input()
PRINT("Is" + name + "correct?")

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
