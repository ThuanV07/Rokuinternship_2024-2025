function onKeyEvent(key, press) as Boolean
    m.answer_list = m.top.findNode("answer_list")
    if key = "down"
        m.answer_list.jumpToItem = 0
    else if key = "up"
        m.answer_list.jumpToItem = 3
    end if
    return true
end function
