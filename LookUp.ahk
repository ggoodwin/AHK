if not A_IsAdmin
{
  Run *RunAs "%A_ScriptFullPath%"
  ExitApp
}

#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
#SingleInstance Force
SetTitleMatchMode 2

!g::
MyClip := ClipboardAll
Clipboard =
Send, ^c
ClipWait, 2
if ErrorLevel
{
  return
}

StringReplace, Clipboard, Clipboard, `r`n, %A_Space%, All
StringReplace, Clipboard, Clipboard, #, `%23, All
StringReplace, Clipboard, Clipboard, &, `%26, All
StringReplace, Clipboard, Clipboard, +, `%2b, All
StringReplace, Clipboard, Clipboard, ", `%22, All
Run % "https://www.google.com/search?hl=en&q=" . clipboard ; uriEncode(clipboard)

Clipboard := MyClip
return

; Handy function.
; Copies the selected text to a variable while preserving the clipboard.
GetText(ByRef MyText = "")
{
  SavedClip := ClipboardAll
  Clipboard =
  Send ^c
  ClipWait 0.5
  If ERRORLEVEL
  {
    Clipboard := SavedClip
    MyText =
    Return
  }
  MyText := Clipboard
  Clipboard := SavedClip
  Return MyText
}

; Pastes text from a variable while preserving the clipboard.
PutText(MyText)
{
  SavedClip := ClipboardAll 
  Clipboard =              ; For better compatability
  Sleep 20                 ; with Clipboard History
  Clipboard := MyText
  Send ^v
  Sleep 100
  Clipboard := SavedClip
  Return
}