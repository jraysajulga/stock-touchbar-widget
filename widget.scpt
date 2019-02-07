# Parameters
set ticker to "FB"
set limit to 166.15

# Retrieve stock price
set impNumbers to (do shell script "curl -s \"https://www.marketwatch.com/investing/stock/" & ticker & "\" |grep '<meta name=\"price\" content=\"' |cut -d'\"' -f4")
set diff to impNumbers - limit # calculate different from chosen limit

# Sets up character meter that quantifies diff visually
set n to (round (diff / impNumbers * 100 * 10))
if n < 0 then
	set n to -n
end if
set dots to ""
repeat n times
	set dots to dots & "_"
end repeat
return ticker & ": " & impNumbers & " (" & diff & ")" & dots