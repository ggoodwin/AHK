if not A_IsAdmin
{
  Run *RunAs "%A_ScriptFullPath%"
  ExitApp
}

SendMode Input
SetWorkingDir, %A_ScriptDir%

#SingleInstance, Force

^+t:: 

InputBox, userInput, Enter file name, , , 150, 100

FileAppend, Secure File, *C:\Users\gregg\Documents\MEGAsync\Texts\%userInput%.txt

RunWait, powershell.exe -File "Encrypt.ps1" "%userInput%.txt", , Hide

Sleep, 2000

Run, C:\Users\gregg\Documents\MEGAsync\Texts\%userInput%-txt.axx