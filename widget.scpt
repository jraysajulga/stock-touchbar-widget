set ticker to "FB"
set impNumbers to (do shell script "curl -s \"https://www.marketwatch.com/investing/stock/" & ticker & "\" |grep '<meta name=\"price\" content=\"' |cut -d'\"' -f4")
return ticker & ": " & impNumbers