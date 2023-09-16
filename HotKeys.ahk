;----------------------------------------
; Hotkey AutoHotkey Scripts
;----------------------------------------

;----------------------------------------
; Initialization
;----------------------------------------

; Launch as Admin
if not A_IsAdmin
{
  Run *RunAs "%A_ScriptFullPath%"
  ExitApp
}
#NoEnv

SendMode Input
SetWorkingDir, %A_ScriptDir%

#SingleInstance, Force

;----------------------------------------
; Hotkeys
;----------------------------------------

; Powershell
#IfWinActive ahk_class CabinetWClass
^+p::
    pwshHere()
    return
#IfWinActive

; Create and Open Encrypted Text File
^+t:: createEncryptedTextFile()

; GitHub Clone
^+g:: gitHubClone()

; Open in Notepad++
^!n:: openInNotepadPlusPlus()

;----------------------------------------
; Functions
;----------------------------------------

; Create and Encrypt Text File
createEncryptedTextFile()
{
  InputBox, userInput, Enter file name, , , 150, 100

  FileAppend, Secure File, *C:\Users\gregg\Proton Drive\coyto\My files\Encrypted\Texts\%userInput%.txt

  RunWait, powershell.exe -File "Encrypt.ps1" "C:\Users\gregg\Proton Drive\coyto\My files\Encrypted\Texts\%userInput%.txt", , Hide

  Sleep, 5000

  Run, "C:\Users\gregg\Proton Drive\coyto\My files\Encrypted\Texts\%userInput%-txt.axx"

  Exit
}

; Clone GitHub Repository
gitHubClone()
{
  InputBox, userInput, Enter repository url, , , 150, 100

  Send {g}{i}{t}{Space}{c}{l}{o}{n}{e}{Space}%userInput%{Enter}

  Sleep, 1000

  Send {8}{0}{2}{5}{3}{r}{d}{A}{v}{e}{N}{#}{Enter}

  Exit
}

; Open Powershell in current folder
pwshHere()
{
  If WinActive("ahk_class CabinetWClass") || WinActive("ahk_class ExploreWClass") {
    WinHWND := WinActive()
    For win in ComObjCreate("Shell.Application").Windows
      If (win.HWND = WinHWND) {
        dir := SubStr(win.LocationURL, 9) ; remove "file:///"
        dir := RegExReplace(dir, "%20", " ")
        Break
      }
      Run, pwsh, % dir ? dir : A_Desktop
      WinActivate, "Administrator: C:\Program Files\PowerShell\7\pwsh.exe"
  }
}

; Open File in Notepad++
openInNotepadPlusPlus()
{
  items := selectedItems()
  For index, item in StrSplit(items, ",")
    Run, "C:\Program Files\Notepad++\notepad++.exe" %item%
}

;----------------------------------------
; Utility Functions
;----------------------------------------

; Get Selected Items in Explorer
selectedItems()
{
  If WinActive("ahk_class CabinetWClass")                       ; EXPLORER WINDOW
  {
    for window in ComObjCreate("Shell.Application").Windows
      if window.HWND = WinExist("A")
        this_window := window
    
    if(this_window.Document.SelectedItems.Count > 1)		
    {
      these_items := ""
      for item in this_window.Document.SelectedItems
        these_items .= item.Path . ","
      return these_items
    }
    else							
      return this_window.Document.FocusedItem.Path
  }

  If WinActive("ahk_class Progman") 	                        ; DESKTOP
  {
    ControlGet, selectedItems, List, Selected Col1, SysListView321, ahk_class Progman
    if InStr(selectedItems, "`n") and (StrLen(selectedItems) > 0)	
    {
      these_items := ""
      Loop, Parse, selectedItems, `n, `r
        these_items .= A_Desktop . "\" . A_LoopField . ","DDDD
      return these_items
    }
    else							
    {
      If StrLen(selectedItems) > 0								
      return A_Desktop . "\" . selectedItems
    }
  }
}
