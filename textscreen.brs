sub Init()
    audioloadingin()
    ' Initialize all of the nodes for textscreen
    m.rectangleHolder = m.top.findNode("rectangleHolder")
    m.firsthalftext = m.top.findNode("firsthalftext")
    m.LessonImage = m.top.findNode("LessonImage")
    m.scrolltext = m.top.findNode("scrolltext")
    m.triviatext = m.top.findNode("triviatext")
    m.backbutton = m.top.findNode("backbutton")
    if m.backbutton <> invalid
        ? "whgfhwgfkjhsgfkjhg"
    end if
    m.scrolltext.setFocus(true)
    m.scrolltextlist = []
    m.trivialist = []
    loadTextScreen()
    m.scrolltext.Observefield("buttonSelected", "onKeyEvent")
end sub



function onKeyEvent(key as string, press as boolean) as boolean
    if key = "left" and m.scrolltext.hasfocus()
        m.scrolltext.setFocus(false)    
        m.backbutton.setFocus(true)
    end if 
    if key = "right" and m.backbutton.setFocus(true)
        m.backbutton.setFocus(false)
        m.scrolltext.setFocus(true)
    end if

    return true
end function

' Loads up the textscreen to be showing
sub loadTextScreen()
    m.rectangleHolder.visible = true
    m.firsthalftext.visible =  true
    m.LessonImage.visible = true
    m.scrolltext.visible = true
    m.triviatext.visible = true
end sub

sub audioloadingin()
    m.audio = CreateObject("roSGNode", "Audio")
    m.audioContent = CreateObject("roSGNode", "ContentNode")
    m.audioContent.url = "https://audio.jukehost.co.uk/s28k2uaOzhhqxH3Cmxw804XsRt6jc5cp" 
    m.audio.content = m.audioContent
    m.audio.control = "play"
end sub

sub textContentSwitch(index as integer)
    m.rectangleHolder.uri = "pkg:/images/Lesson" + index + ".png"
    m.firsthalftext.text = "Lesson " + index
    ' m.LessonImage.uri = "pkg:/images/Lesson" + index + ".png"
    m.scrolltext.text = m.scrolltextList[index]
    m.triviatext.text = m.triviaList[index]
end sub