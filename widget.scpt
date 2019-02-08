# Parameters
set ticker to "FB"
set limit to 166.15
set alert to 165
set dir to "+"

# Retrieve stock price
set price to (do shell script "curl -s \"https://www.marketwatch.com/investing/stock/" & ticker & "\" |grep '<meta name=\"price\" content=\"' |cut -d'\"' -f4")
set diff to price - limit # calculate different from chosen limit

# Sets up character meter that quantifies diff visually
set n to (round (diff / price * 100 * 10))
if n < 0 then
	set n to -n
end if
set dots to ""
repeat n times
	set dots to dots & "_"
end repeat

set alert_msg to ""
if (alert < price) = (dir = "+") then
	set alert_msg to "[ALERT TRIGGERED!]"
end if

return ticker & ": " & price & " (" & diff & ")" & dots & alert_msg