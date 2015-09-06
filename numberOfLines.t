var streamNumber : int
var streamNumber2 : int
var numOfLines : int := 1
var numOfLinesFile : int := 1
var fileName : string
var temp : char

streamNumber := Dir.Open ("src")
assert streamNumber > 0
loop
    fileName := Dir.Get (streamNumber)
    exit when fileName = ""
    fileName := fileName
    if (length (fileName) >= 6) and (fileName (length (fileName) - 4 .. *) = ".java") then
	open : streamNumber2, "src//" + fileName, get
	loop
	    exit when eof(streamNumber2)
	    get : streamNumber2, temp
	    if ord (temp) = 10 then
		numOfLines += 1
		numOfLinesFile += 1
	    end if
	end loop
	close : streamNumber2
	put numOfLinesFile, "\t", fileName
	numOfLinesFile := 1
    end if
end loop
put "****"
put numOfLines
Dir.Close (streamNumber)
