Function Init()
    'for creating a place for the content
    m.top.functionName = "GetContent"

end Function

sub GetContent()

    'parsing the feed WORKS!
    xfer = CreateObject("roUrlTransfer")
    xfer.SetCertificatesFile("common:/certs/ca-bundle.crt")
    xfer.AddHeader("X-Roku-Reserved-Dev-Id", "")
    xfer.InitClientCertificates()
    xfer.setURL("https://thuanv07.github.io/RokuCodeDump/Basic%20lesson%20screen%20layout/components/quizscreen/json/lesson1.json")
    
    m.jsonContent = ParseJson(xfer.getToString())
    'test debug 
    ? m.jsonContent
    ? m.jsonContent.questions
    for each question in m.jsonContent.questions
        ? question.question
    end for
    ? "test " 
    ? m.jsonContent.questions[0].question
    ?m.jsonContent.questions[1].options


        
        'Manually populate the array with information
    m.jsoninfo = []
    for start = 0 to m.jsonContent.questions.count() - 1
        ' Create a row for the list
        row = [
            m.jsonContent.questions[start].question,  ' Question text
            m.jsonContent.questions[start].options,  ' Options for the question
            m.jsonContent.questions[start].answer     ' Correct answer
        ]
        m.jsoninfo.push(row)
    end for

    ' Debug: Print the list data


    for each item in m.jsoninfo
        ? item
    end for

    
end sub

