sub main()
    ' Create the screen object
    screen = CreateObject("roSGScreen")
    ' Set up the message port
    port = CreateObject("roMessagePort")
    screen.SetMessagePort(port)

    ' Create the scene
    scene = screen.CreateScene("titlescreen")
    if scene <> invalid then
        ?"Scene 'titlescreen' created successfully"
    else
        ?"Error: Scene 'titlescreen' creation failed"
    end if

    screen.Show() ' Show the screen
    ?"Screen shown"

    ' Main event loop
    while true
        msg = Wait(0, port) ' Wait for events
        if type(msg) = "roSGScreenEvent"
            if msg.IsScreenClosed() then exit while
        end if
    end while
end sub