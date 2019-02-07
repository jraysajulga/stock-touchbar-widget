set ticker to "FB"
set limit to 165.6
set impNumbers to (do shell script "curl -s \"https://www.marketwatch.com/investing/stock/" & ticker & "\" |grep '<meta name=\"price\" content=\"' |cut -d'\"' -f4")
set diff to impNumbers - limit
return ticker & ": " & impNumbers & " (" & diff & ")"