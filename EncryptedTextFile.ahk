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

  RunWait, powershell.exe -File "Encrypt.ps1" "C:\Users\gregg\Documents\MEGAsync\Texts\%userInput%.txt", , Hide

  Sleep, 2000

  Run, C:\Users\gregg\Documents\MEGAsync\Texts\%userInput%-txt.axx

  Exit

^+m::

  InputBox, userInput, Enter file name, , , 150, 100

  FileAppend, Secure File, *C:\Users\gregg\Documents\MEGAsync\Markdown\%userInput%.md

  RunWait, powershell.exe -File "Encrypt.ps1" "C:\Users\gregg\Documents\MEGAsync\Markdown\%userInput%.md", , Hide

  Sleep, 2000

  Run, C:\Users\gregg\Documents\MEGAsync\Markdown\%userInput%-md.axx

  Exit

^+c::

  InputBox, userInput, Enter file name, , , 150, 100

  FileAppend, Secure File, *C:\Users\gregg\Documents\MEGAsync\Crypto\%userInput%.txt

  RunWait, powershell.exe -File "Encrypt.ps1" "C:\Users\gregg\Documents\MEGAsync\Crypto\%userInput%.txt", , Hide

  Sleep, 2000

  Run, C:\Users\gregg\Documents\MEGAsync\Crypto\%userInput%-txt.axx

  Exit