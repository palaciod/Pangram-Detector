fun find(x: char,[]) = "false"
| find(x: char,a: char list) = (if x=(hd a) then "true" else find(x,tl a) )

fun nextChar([],xs: char list) = "true\n"
| nextChar(az: char list, xs: char list) = if find(hd az,xs)="true" then nextChar(tl az,xs) else "false\n"

 val alph = "abcdefghijklmnopqrtuvwxyz";
val alphList = explode(alph);

fun hw1(inFile : string, outFile : string) =
let

val inStream = TextIO.openIn inFile
val outStream = TextIO.openOut outFile
val readLine = TextIO.inputLine inStream

fun helper(readLine : string option) =
	case readLine of
		NONE => (TextIO.closeIn inStream; TextIO.closeOut outStream)
		| SOME(c) => (TextIO.output(outStream,nextChar(alphList,explode(c)));
		helper(TextIO.inputLine inStream))
	in
		helper(readLine)
	end
