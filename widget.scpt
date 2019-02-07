set ticker to "AAPL"
repeat with theTicker in ticker
	set impNumbers to (do shell script "curl -s \"https://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol=SPY&apikey=FTT6EZXS71DJDVBO\"")
end repeat
return "AAPL: " & impNumbers