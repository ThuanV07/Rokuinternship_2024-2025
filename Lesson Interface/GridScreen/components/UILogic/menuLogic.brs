' ********** Copyright 2020 Roku Corp.  All Rights Reserved. **********

' Note that we need to import this file in MainScene.xml using relative path.

sub Showmenu()
    m.menu = CreateObject("roSGNode", "menu")
    m.menu.ObserveField("poster_selected", "OnMenuScreenSelected")
    ? "menu is shown"
    ShowScreen(m.menu) ' show menu
end sub

sub OnMenuScreenSelected(event as object)
    ? "GRID SCREEN IS CHANGED INTO HERE!!!"
    RunContentTask()
    ShowGridScreen()
end sub
