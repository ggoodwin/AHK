if not A_IsAdmin
{
  Run *RunAs "%A_ScriptFullPath%"
  ExitApp
}
#NoEnv

SendMode Input
SetWorkingDir, %A_ScriptDir%

#SingleInstance, Force

#IfWinActive ahk_class CabinetWClass
^+p::
    pwshHere()
    return
#IfWinActive

^+t:: 

  InputBox, userInput, Enter file name, , , 150, 100

  FileAppend, Secure File, *C:\Users\gregg\Documents\MEGAsync\Texts\%userInput%.txt

  RunWait, powershell.exe -File "Encrypt.ps1" "C:\Users\gregg\Documents\MEGAsync\Texts\%userInput%.txt", , Hide

  Sleep, 5000

  Run, C:\Users\gregg\Documents\MEGAsync\Texts\%userInput%-txt.axx

  Exit

^+d::

  InputBox, userInput, Enter file name, , , 150, 100

  FileAppend, Secure File, *C:\Users\gregg\Documents\MEGAsync\Documents\%userInput%.docx

  RunWait, powershell.exe -File "Encrypt.ps1" "C:\Users\gregg\Documents\MEGAsync\Documents\%userInput%.docx", , Hide

  Sleep, 5000

  Run, C:\Users\gregg\Documents\MEGAsync\Documents\%userInput%-docx.axx

  Exit

^+f::

  InputBox, userInput, Enter file name, , , 150, 100

  FileAppend, Secure File, *C:\Users\gregg\Documents\MEGAsync\Documents\%userInput%.pdf

  RunWait, powershell.exe -File "Encrypt.ps1" "C:\Users\gregg\Documents\MEGAsync\Documents\%userInput%.pdf", , Hide

  Sleep, 5000

  Run, C:\Users\gregg\Documents\MEGAsync\Documents\%userInput%-pdf.axx

  Exit
  
pwshHere(){
If WinActive("ahk_class CabinetWClass") || WinActive("ahk_class ExploreWClass") {
If WinActive("ahk_class CabinetWClass") || WinActive("ahk_class ExploreWClass") {
        WinHWND := WinActive()
        For win in ComObjCreate("Shell.Application").Windows
            If (win.HWND = WinHWND) {
                dir := SubStr(win.LocationURL, 9) ; remove "file:///"
                dir := RegExReplace(dir, "%20", " ")
                Break
            }
    }
    Run, pwsh, % dir ? dir : A_Desktop
    WinActivate, "Administrator: C:\Program Files\PowerShell\7\pwsh.exe"
    }
}