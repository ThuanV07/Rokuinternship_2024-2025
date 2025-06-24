sub Init()
    ' Initialize all of the nodes for textscreen
    m.RectangleHolder = m.top.findNode("RectangleHolder")
    m.firsthalftext = m.top.findNode("firsthalftext")
    m.LessonImage = m.top.findNode("LessonImage")
    m.secondhalftext = m.top.findNode("secondhalftext")
    m.triviatext = m.top.findNode("triviatext")
    ' initialize hard code list 
    m.firsthalftextlist = []
    loadTextScreen()
    m.audio = CreateObject("roSGNode", "Audio")
    m.audioContent = CreateObject("roSGNode", "ContentNode")
    m.audioContent.url = "https://audio.jukehost.co.uk/bvK7WFCFaoBQiZhYfBPvMHumJ3nyXCUK" 
    m.audio.content = m.audioContent
    m.audio.control = "play"
end sub

' Loads up the textscreen to be showing
sub loadTextScreen()
    m.RectangleHolder.visible = true
    m.firsthalftext.visible =  true
    m.LessonImage.visible = true
    m.secondhalftext.visible = true
    m.triviatext.visible = true
end sub
