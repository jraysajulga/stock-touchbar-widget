# Parameters
set ticker to "ACB"
set limit to 8.8
set alert1 to 8.77
set dir1 to "-"
set alert2 to 8.9
set dir2 to "+"

# Retrieve stock price
set price to (do shell script "curl -s \"https://www.marketwatch.com/investing/stock/" & ticker & "\" |grep '<meta name=\"price\" content=\"' |cut -d'\"' -f4")
set diff to price - limit # calculate different from chosen limit

# Sets up character meter that quantifies diff visually
set n to (round (diff / price * 1000))
if n < 0 then
	set n to -n
end if
set dots to ""
repeat n times
	set dots to dots & "|"
end repeat

set alert_msg to ""
if ((alert1 ≤ price) = (dir1 = "+")) or ((alert2 ≤ price) = (dir2 = "+")) then
	set alert_msg to " 🔔🔔🔔🔔🔔🔔[ALERT TRIGGERED!]🔔🔔🔔🔔🔔🔔"
end if

return dots & " " & ticker & ": " & price & " (" & diff & ") " & dots & "
" & "L: " & limit & "  🔔: " & alert1 & ", " & alert2 & alert_msg