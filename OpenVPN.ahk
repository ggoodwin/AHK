if not A_IsAdmin
{
  Run *RunAs "%A_ScriptFullPath%"
  ExitApp
}

#NoEnv

SendMode Input
SetWorkingDir %A_ScriptDir%
#Persistent
SetTitleMatchMode 2

; Set a hotkey to pause and un-pause the script
Hotkey, Home, TogglePause

SetTimer, OpenVMWare, 300000
Return

OpenVMWare:
  WinRestore, vk1524599
  Sleep 1000
  Click, 2139, 949
  Sleep 1000
  WinMinimize, vk1524599
Return

; This is the function that gets called when the hotkey is pressed
TogglePause:
  Pause, Toggle
return