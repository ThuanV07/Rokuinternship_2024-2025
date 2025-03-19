function init()
    m.mainMenu = m.top.findNode("MainMenu")
    if m.mainMenu <> invalid then
        ?"MainMenu node found"
        m.mainMenu.observeField("childFocus", "onButtonFocused")
    else
        ?"Error: MainMenu node not found"
    end if

    m.AppTitle = m.top.findNode("AppTitle")
    if m.AppTitle <> invalid then
        ?"AppTitle node found"
        m.AppTitle.font.size = 75
    else
        ?"Error: AppTitle node not found"
    end if

    m.titlescreenbg = m.top.findNode("titlescreenbg")
    if m.titlescreenbg = invalid then
        ?"Error: titlescreenbg node not found"
    else
        ?"titlescreenbg node found"
    end if
end function

function onButtonFocused()
    focusedButton = m.mainMenu.childFocus
    ?"Focused button: " + focusedButton.id

    if focusedButton.id = "startgame"
        ?"Start Game focused"
        ' Add functionality to start the game
    else if focusedButton.id = "settings"
        ?"Settings focused"
        ' Add functionality to open settings
    else if focusedButton.id = "exitgame"
        ?"Exit focused"
        ' Add functionality to quit the game
    else
        ?"Unknown button focused"
    end if
end function