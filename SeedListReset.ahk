#NoEnv
#SingleInstance Force
#IfWinActive, Minecraft

FileRead, Index, i.txt
Array := Object()
InputBox, SeedList, Enter the file with the seeds

Loop, Read, %SeedList%
{
    Array[A_Index] := A_LoopReadLine
}

Reset()
{
    global Index
    global Array
	Seed .= Array[Index]

	FileRead, Index, i.txt
	Index := Index + 1
	FileDelete, i.txt
	FileAppend, %Index%, i.txt

    send {Esc}{Esc}{Esc}
    send {Tab}{Enter}
    send {Tab}
    send {Tab}{Tab}{Enter}
    send {Tab}{Tab}{Enter}{Enter}{Enter}{Tab}{Tab}{Tab}
    send {Tab}{Enter}
    send {Tab}{Tab}{Tab}
    Send %Seed%
    Send {Shift}+{Tab}
    send {Shift}+{Tab}{Enter}
}

J::Reset()
