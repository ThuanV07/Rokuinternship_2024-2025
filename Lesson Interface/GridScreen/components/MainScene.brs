' ********** Copyright 2020 Roku Corp.  All Rights Reserved. **********

' entry point of  MainScene
' Note that we need to import this file in MainScene.xml using relative path.
sub Init()
    ' set background color for scene. Applied only if backgroundUri has empty value
    m.top.backgroundColor = "0x662D91"
    m.top.backgroundUri= "pkg:/images/backgroundday.png"
    m.loadingIndicator = m.top.FindNode("loadingIndicator") ' store loadingIndicator node to m
    m.title = m.top.FindNode("title") ' store title node to m
    m.mainmenu = m.top.FindNode("menubutton") ' store mainmenu node to m
    m.mainmenu.setFocus(true) ' set focus to mainmenu
    m.mainmenu.observeField("buttonSelected", "OnMainMenuSelected") ' observe selectedIndex field of mainmenu
    InitScreenStack()
    
end sub

function OnMainMenuSelected()
    ' This function is called when the selectedIndex of mainmenu changes
    ' It can be used to handle menu selection changes if needed
    m.mainmenu.setFocus(false)
    m.title.visible = false ' hide title when mainmenu is selected
    m.mainmenu.visible = false
    RunContentTask()
    ShowGridScreen()
    return false
end function

' The OnKeyEvent() function receives remote control key events
function OnkeyEvent(key as String, press as Boolean) as Boolean
    result = false
    if press
        ' handle "back" key press
        if key = "back"
            numberOfScreens = m.screenStack.Count()
            ' close top screen if there are two or more screens in the screen stack
            if numberOfScreens > 1
                CloseScreen(invalid)
                result = true
            end if
        end if
    end if
    ' The OnKeyEvent() function must return true if the component handled the event,
    ' or false if it did not handle the event.
    return result
end function
